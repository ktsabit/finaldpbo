namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/product.ui")]
    public class Product_Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label nama;
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
        private unowned Gtk.Image img;


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
            builder.end_object ();
        
            Json.Generator generator = new Json.Generator ();
            Json.Node root = builder.get_root ();
            generator.set_root (root);
            string str = generator.to_data (null);
            string res = sendHTTPrequest (str, "http://angkit.ktsabit.com/getBatch", "POST", "application/json");
            
            Batch batch = jsonParse (res);
            nama.set_text (batch.nama);
            jenis_ternak.set_text (batch.jenis_ternak);
            spesies.set_text (batch.spesies);
            tanggal_mulai.set_text (batch.tgl_mulai);
            tanggal_kemas.set_text (batch.tgl_kemas);
            tanggal_potong.set_text (batch.tgl_potong);
            File imageFile = getImage (batch.images.get (0));
            img.set_from_file (imageFile.get_path ());
            img.height_request = 500;
        }
    }
}
