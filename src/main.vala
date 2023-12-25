/* main.vala
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

int main (string[] args) {

    //  Json.Builder builder = new Json.Builder ();
    //  builder.begin_object ();
    //  builder.set_member_name ("id");
    //  builder.add_string_value ("Z0aZpw");
    //  builder.end_object ();

    //  Json.Generator generator = new Json.Generator ();
    //  Json.Node root = builder.get_root ();
    //  generator.set_root (root);
    //  string str = generator.to_data (null);
    //  string res = sendHTTPrequest (str, "http://angkit.ktsabit.com/getBatch", "POST", "application/json");
    //  //  print(res);
    //  Batch batch = jsonParse (res);
    //  foreach (var img in batch.images) print(img);
    makeDataDir ();
    var app = new Finaldpbo.Application ();
    //  getImage ("bc16ddc4f53c429c89fd58ed08076734.png");
    return app.run (args);
    //  return 0;
}