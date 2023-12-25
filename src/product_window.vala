namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/product.ui")]
    public class Product_Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label nama;
        [GtkChild]
        private unowned Gtk.Label jenis_ternak;
        [GtkChild]
        private unowned Gtk.Label spesies;

        construct {
            var css_provider = new Gtk.CssProvider ();
            string path = "/home/kadafi/Projects/dpbo/finaldpbo/src/style.css";
            css_provider.load_from_path (path);
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
            nama.set_text (batch.nama);
            jenis_ternak.set_text (batch.jenis_ternak);
            spesies.set_text (batch.spesies);
        }
    }
}
