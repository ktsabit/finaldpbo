/* window.vala
 *
 * Copyright 2023 debian
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Finaldpbo {
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/window.ui")]
    public class Window : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label label;

        construct {
            Json.Builder builder = new Json.Builder ();
            builder.begin_object ();
            builder.set_member_name ("id");
            builder.add_string_value ("Z0aZpw");
            //  builder.set_member_name ("password");
            //  builder.add_string_value ("kaisan");
            builder.end_object ();
        
            Json.Generator generator = new Json.Generator ();
            Json.Node root = builder.get_root ();
            generator.set_root (root);
            string str = generator.to_data (null);
        
            string res = sendHTTPrequest (str, "http://angkit.ktsabit.com/getBatch", "POST", "application/json");
            label.set_label (res);
        }

        public Window (Gtk.Application app) {
            Object (application: app);
        }
    }
}
