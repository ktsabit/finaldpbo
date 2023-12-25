class DataBase {
    private Sqlite.Database db;
    private Sqlite.Statement stmt;
    int ec;

    public DataBase(string path) {
        ec = Sqlite.Database.open(path, out db);
        if (ec != Sqlite.OK) {
            stderr.printf("Can't open database: %d: %s\n", db.errcode(), db.errmsg());
        }
    }

    public void query(string sql) {
      ec = db.prepare_v2 (sql, sql.length, out stmt);
      if(ec == Sqlite.CONSTRAINT) {
        stderr.printf ("Username sudah ada\n");
      } else if (ec != Sqlite.OK) {
        stderr.printf ("Errorr: %d: %s\n", db.errcode (), db.errmsg ());
      }
    }

    public void bind_params(string types, ...) {
      var list = va_list();
      int index = 1;
      for (string? val = list.arg<string?> (); val != null ; val = list.arg<string?> ()) {
        if(types[index-1] == 'i') {
          stmt.bind_int(index, int.parse(val));
        } else if(types[index-1] == 'd') {
          stmt.bind_double(index, double.parse(val));
        } else if(types[index-1] == 's') {
          stmt.bind_text(index, val);
        }
        index++;
      }
    }

    public Gee.List<Gee.HashMap> fetchAll() {
      Gee.List<Gee.HashMap<string, string>> result = new Gee.ArrayList<Gee.HashMap<string, string>>();
      int cols = stmt.column_count ();
      while (stmt.step () == Sqlite.ROW) {
        Gee.HashMap<string, string> row = new Gee.HashMap<string, string>();
        for (int i = 0; i < cols; i++) {
          string col_name = stmt.column_name (i) ?? "<none>";
          string val = stmt.column_text (i) ?? "<none>";
          row.set(col_name, val);
        }
        result.add(row);
      }
      stmt.reset ();
      return result;
    }

    public int execute() {
      ec = stmt.step();
      if(ec == Sqlite.CONSTRAINT) {
        return Sqlite.CONSTRAINT;
      } else if (ec != Sqlite.DONE) {
        stderr.printf("Error executing prepared statement: %d: %s\n", db.errcode(), db.errmsg());
        return db.errcode();
      }
      stmt.reset ();
      return Sqlite.DONE;
    }

    public Gee.HashMap fetch() {
      Gee.HashMap<string, string> result = new Gee.HashMap<string, string>();
      int cols = stmt.column_count ();
      while (stmt.step () == Sqlite.ROW) {
        for (int i = 0; i < cols; i++) {
          string col_name = stmt.column_name (i) ?? "<none>";
          string val = stmt.column_text (i) ?? "<none>";
          result.set(col_name, val);

        }
      }
      stmt.reset ();
      return result;
    }
}
