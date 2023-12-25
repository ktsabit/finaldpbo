namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/input.ui")]
    public class Input_Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Button button;

        construct {
            var css_provider = new Gtk.CssProvider ();
            string path = "/home/juned/Ned Files/Projects/finaldpbo/src/style.css";
            css_provider.load_from_path (path);
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            //  button.set_size_request(10, 10); // Set the width to 100 pixels and height to 50 pixels
            //  button.width_request = 200;

            button.clicked.connect (() => {
                new Finaldpbo.Detail_Window (new Finaldpbo.Application()).present ();
            });

        }

        public Input_Window (Gtk.Application app) {
            Object (application: app);
        }
    }
}
