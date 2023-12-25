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
    [GtkTemplate (ui = "/com/ktsabit/finaldpbo/ui/window.ui")]
    public class Window : Gtk.ApplicationWindow {
        // register
        [GtkChild]
        private unowned Gtk.Entry register_username;
        [GtkChild]
        private unowned Gtk.Entry register_password;
        [GtkChild]
        private unowned Gtk.Button register_btn;
        [GtkChild]
        private unowned Gtk.Button to_login_btn;

        // login
        [GtkChild]
        private unowned Gtk.Entry login_username;
        [GtkChild]
        private unowned Gtk.Entry login_password;
        [GtkChild]
        private unowned Gtk.Button login_btn;
        [GtkChild]
        private unowned Gtk.Button to_register_btn;

        [GtkChild]
        private unowned Gtk.Stack pages;

        [GtkChild]
        private unowned Gtk.Label label;

        DataBase my_db = new DataBase("/home/kadafi/Projects/dpbo/finaldpbo/angkit.db");

        construct {
            my_db.query("SELECT * FROM users");
            Gee.List<Gee.HashMap> result = my_db.fetchAll();
            foreach (Gee.HashMap<string, string> item in result) {
              print(item.get("username") + "\n");
            }

            register_btn.clicked.connect(register);
            login_btn.clicked.connect(login);
            to_login_btn.clicked.connect(() => {
              pages.set_visible_child_name("login");
            });

            to_register_btn.clicked.connect(() => {
              pages.set_visible_child_name("register");
            });
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
            var cssProvider = new Gtk.CssProvider ();
            cssProvider.load_from_resource ("/com/ktsabit/finaldpbo/style/style.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), cssProvider, 1);
            Object (application: app);
        }

        private void register() {
          Gtk.EntryBuffer register_username_buffer = register_username.get_buffer ();
          Gtk.EntryBuffer register_password_buffer = register_password.get_buffer ();
          my_db.query("INSERT INTO users (username, password) VALUES (?, ?);");
          my_db.bind_params("ss", register_username_buffer.text, register_password_buffer.text);
          int res = my_db.execute();
          if(res == Sqlite.CONSTRAINT) {
            var dialog = new Gtk.MessageDialog(this, Gtk.DialogFlags.MODAL, Gtk.MessageType.WARNING, Gtk.ButtonsType.OK, "Username sudah ada");
            dialog.show();
            dialog.response.connect((response) => {
              if(response == Gtk.ResponseType.OK) {
                  dialog.close();
              }
            });
          } else {
            pages.set_visible_child_name("login");
          }
        }

        private void login() {
          Gtk.EntryBuffer login_username_buffer = login_username.get_buffer ();
          Gtk.EntryBuffer login_password_buffer = login_password.get_buffer ();
          my_db.query("SELECT * FROM users WHERE username = ?;");
          my_db.bind_params("s", login_username_buffer.text);
          Gee.HashMap<string, string> res = my_db.fetch();
          if(res.is_empty) {
            var dialog = new Gtk.MessageDialog(this, Gtk.DialogFlags.MODAL, Gtk.MessageType.WARNING, Gtk.ButtonsType.OK, "Anda belum terdaftar");
            dialog.show();
            dialog.response.connect((response) => {
              if(response == Gtk.ResponseType.OK) {
                  dialog.close();
              }
            });
          } else {
            if(login_password_buffer.text != res.get("password")) {
              var dialog = new Gtk.MessageDialog(this, Gtk.DialogFlags.MODAL, Gtk.MessageType.WARNING, Gtk.ButtonsType.OK, "password salah");
              dialog.show();
              dialog.response.connect((response) => {
                if(response == Gtk.ResponseType.OK) {
                    dialog.close();
                }
              });
            } else {
              pages.set_visible_child_name("home");
            }
          }
        }

    }
}
