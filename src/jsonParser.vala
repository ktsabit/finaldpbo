
public Batch? jsonParse(string response){
    
    try {
        var parser = new Json.Parser ();
        parser.load_from_data (response, -1);
        var root_object = parser.get_root ().get_object ();
        var res = root_object.get_object_member ("data");
        Batch batch = new Batch(res);
        return batch;
    }
    catch (Error e){
        print("error parser: " + e.message);
        return null;
    }

}
