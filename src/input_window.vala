namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/input.ui")]
    public class Input_Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Button button;
        [GtkChild]
        private unowned Gtk.Text input;

        construct {
            button.width_request = 200;
        }

        public Input_Window (Gtk.Application app) {
            Object (application: app);
            button.clicked.connect (() => {
              Gtk.Window product_window = new Product_Window (app, input.text);
              product_window.title = "Product data";
              product_window.present ();
            });
        }
    }
}
