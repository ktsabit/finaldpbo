/* application.vala
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
    public class Application : Gtk.Application {
        public Application () {
            Object (application_id: "com.ktsabit.finaldpbo", flags: ApplicationFlags.FLAGS_NONE);
        }
        public override void activate () {
            base.activate ();
            var win = this.active_window;
            if (win == null) {
                win = new Finaldpbo.Input_Window (this);
            }
            win.present ();
        }
    }
}
