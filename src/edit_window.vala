namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/edit.ui")]
    public class EditWindow : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Box mainBox;
        [GtkChild]
        private unowned Gtk.Entry input;

        construct {
            // mainBox.width_request = 200;
            // mainBox.set_size_request (10, 10);
            //  this.set_title ("Edit Batch");
            mainBox.width_request = 400;
            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource ("/com/ktsabit/finaldpbo/style.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
        }

        public EditWindow (Gtk.Application app) {
            Object (application: app);
        }
    }
}