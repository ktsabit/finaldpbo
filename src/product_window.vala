namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/product.ui")]
    public class Product_Window : Gtk.ApplicationWindow {
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

        construct {
            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource ("/com/ktsabit/finaldpbo/style.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }

        public Product_Window (Gtk.Application app, string id) {
            Object (application: app);

            Json.Builder builder = new Json.Builder ();
            builder.begin_object ();
            builder.set_member_name ("id");
            builder.add_string_value (id);
            // builder.add_string_value ("Z0aZpw");
            builder.end_object ();
        
            Json.Generator generator = new Json.Generator ();
            Json.Node root = builder.get_root ();
            generator.set_root (root);
            string str = generator.to_data (null);
            string res = sendHTTPrequest (str, "http://angkit.ktsabit.com/getBatch", "POST", "application/json");
            
            Batch batch = jsonParse (res);
            
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

            if (batch.berat_rt_sample.to_string() == null) {
                berat_rata_sample.set_text ("null");
            } else {
                berat_rata_sample.set_text (batch.berat_rt_sample.to_string());
            }

        }
    }
}
