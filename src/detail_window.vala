namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/detail.ui")]
    public class Detail_Window : Gtk.ApplicationWindow {

        construct {
            var css_provider = new Gtk.CssProvider ();
            string path = "/home/juned/Ned Files/Projects/finaldpbo/src/style.css";
            css_provider.load_from_path (path);
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            }

        

        public Detail_Window (Gtk.Application app) {
            Object (application: app);
        }
    }
}
