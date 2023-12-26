namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/product.ui")]
    public class DisplayBox : Gtk.Box {
        [GtkChild]
        private unowned Gtk.Label batch_id;
        [GtkChild]
        private unowned Gtk.Label jenis_ternak;
        [GtkChild]
        private unowned Gtk.Label spesies;
        [GtkChild]
        private unowned Gtk.Label tanggal_mulai;
        [GtkChild]
        private unowned Gtk.Label tanggal_kemas;
        [GtkChild]
        private unowned Gtk.Label tanggal_potong;
        [GtkChild]
        private unowned Gtk.Label peternak;
        [GtkChild]
        private unowned Gtk.Label peternak_lokasi;
        [GtkChild]
        private unowned Gtk.Label distributor;
        [GtkChild]
        private unowned Gtk.Label distributor_lokasi;
        [GtkChild]
        private unowned Gtk.Label berat_rata_sample;
        [GtkChild]
        private unowned Gtk.Box imgBox;



        public DisplayBox (Gtk.Application app, string id) {

            if (id == "bad input") {
                Gtk.Label label = new Gtk.Label ("ID harus 6 karakter alfanumerik");
                while (this.get_last_child() != null) this.remove (this.get_last_child());
                this.append (label);
                this.set_size_request (5, 5);
                return;
            }

            Json.Builder builder = new Json.Builder ();
            builder.begin_object ();
            builder.set_member_name ("id");
            builder.add_string_value (id);
            builder.end_object ();

            Json.Generator generator = new Json.Generator ();
            Json.Node root = builder.get_root ();
            generator.set_root (root);
            string str = generator.to_data (null);
            string res = sendHTTPrequest (str, "http://angkit.ktsabit.com/getBatch", "POST", "application/json");


            Batch batch = jsonParse (res);

            if (batch.id == null) {
                Gtk.Label label = new Gtk.Label ("Batch tidak ditemukan");
                while (this.get_last_child() != null) this.remove (this.get_last_child());
                this.append (label);
                this.set_size_request (5, 5);
                return;
            }

            this.set_size_request (1000, 700);


            if (batch.id == null) {
                batch_id.set_text ("null");
            } else {
                batch_id.set_text (batch.id);
            }

            if (batch.peternak.nama == null) {
                peternak.set_text ("null");
            } else {
                peternak.set_text (batch.peternak.nama);
            }

            if (batch.distributor.nama == null) {
                distributor.set_text ("null");
            } else {
                distributor.set_text (batch.distributor.nama);
            }

            if (batch.distributor.lokasi == null) {
                distributor_lokasi.set_text ("null");
            } else {
                distributor_lokasi.set_text (batch.distributor.lokasi);
            }

            if (batch.peternak.lokasi == null) {
                peternak_lokasi.set_text ("null");
            } else {
                peternak_lokasi.set_text (batch.peternak.lokasi);
            }

            if (batch.jenis_ternak == null) {
                jenis_ternak.set_text ("null");
            } else {
                jenis_ternak.set_text (batch.jenis_ternak);
            }

            if (batch.spesies == null) {
                spesies.set_text ("null");
            } else {
                spesies.set_text (batch.spesies);
            }

            if (batch.tgl_mulai == null) {
                tanggal_mulai.set_text ("null");
            } else {
                tanggal_mulai.set_text (batch.tgl_mulai);
            }

            if (batch.tgl_kemas == null) {
                tanggal_kemas.set_text ("null");
            } else {
                tanggal_kemas.set_text (batch.tgl_kemas);
            }

            if (batch.tgl_potong == null) {
                tanggal_potong.set_text ("null");
            } else {
                tanggal_potong.set_text (batch.tgl_potong);
            }

            if (batch.berat_rt_sample.to_string () == null) {
                berat_rata_sample.set_text ("null");
            } else {
                berat_rata_sample.set_text (batch.berat_rt_sample.to_string ());
            }

            foreach (var image in batch.images) {
                File imageFile = getImage (image);
                Gtk.Image img = new Gtk.Image.from_file (imageFile.get_path ());
                img.set_hexpand (true);
                img.height_request = 340;
                imgBox.append (img);
            }
        }
    }
}