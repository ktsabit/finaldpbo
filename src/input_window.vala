namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/input.ui")]
    public class Input_Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Button button;
        [GtkChild]
        private unowned Gtk.Text input;
        [GtkChild]
        private unowned Gtk.Box mainBox;

        Gtk.Application app;

        construct {
            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource ("/com/ktsabit/finaldpbo/style.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            button.width_request = 200;
        }

        public Input_Window (Gtk.Application app) {
            Object (application: app);

            //  Gtk.AlertDialog dialog = new Gtk.AlertDialog ("error");
            //  dialog.show(this);
            button.clicked.connect (changePage);
            this.app = app;
        }

        void changePage() {
            string text = input.text;
            if (!/^[A-Z0-9]{6}$/i.match (input.text)) text = "bad input";
            DisplayBox grid = new DisplayBox (app, text);
            Gtk.Widget? widget = mainBox.get_last_child();
            if (widget.get_type() == typeof(DisplayBox)) {
                mainBox.remove(widget);
            }
            mainBox.append(grid);
            
            //  Gtk.Window product_window = new Product_Window (this.app, text);
            //  product_window.title = "Product data";
            //  product_window.present ();

        }
    }
}