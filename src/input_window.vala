namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/input.ui")]
    public class Input_Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Button button;
        [GtkChild]
        private unowned Gtk.Text input;

        Gtk.Application app;

        construct {
            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource ("/com/ktsabit/finaldpbo/style.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            button.width_request = 200;
        }

        public Input_Window (Gtk.Application app) {
            Object (application: app);
            button.clicked.connect (() => {
                if (!/^[A-Z0-9]{6}$/.match (input.text)) return;
                Gtk.Window product_window = new Product_Window (app, input.text);
                product_window.title = "Product data";
                product_window.present ();
            });
        }
    }
}