
public Batch? jsonParse(string response){
    
    try {
        var parser = new Json.Parser ();
        parser.load_from_data (response, -1);
        var root_object = parser.get_root ().get_object ();
        if (root_object.get_string_member("status") != "ok") {
            return new Batch(null);
        }
        var res = root_object.get_object_member ("data");
        Batch batch = new Batch(res);
        return batch;
    }
    catch (Error e){
        print("error parser: " + e.message);
        return null;
    }

}
