namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/detail.ui")]
    public class Input_Window : Gtk.ApplicationWindow {
        //  [GtkChild]
        //  private unowned Gtk.Button button;

        construct {

            //  button.set_size_request(10, 10); // Set the width to 100 pixels and height to 50 pixels
            //  button.width_request = 200;
        }

        public Input_Window (Gtk.Application app) {
            Object (application: app);
        }
    }
}
