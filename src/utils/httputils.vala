string bytesToStr (Bytes bytes) {
    return (string) bytes.get_data ();
}

Bytes strToBytes (string str) {
    uint8[] chr = (uint8[]) str.to_utf8 ();
    Bytes bytes = new Bytes.take (chr);
    return bytes;
}

void makeDataDir () {

    File dataDir = File.new_for_path ("%s/angkit".printf (Environment.get_user_data_dir ()));
    if (dataDir.query_exists ()) return;
    try {
        dataDir.make_directory (null);
    } catch (GLib.Error e) {
        print("Error creating directory: %s\n".printf(e.message));
    }
}


string sendHTTPrequest (string data, string url, string method, string ctype) {

    Soup.Message msg = new Soup.Message (method, url);
    Soup.Session session = new Soup.Session ();
    msg.set_request_body_from_bytes (ctype, strToBytes (data));
    Bytes response;
    try {
        response = session.send_and_read(msg);

    }
    catch (Error e){
        response = strToBytes (e.message);
    }
    return bytesToStr (response);
}


void saveImage (string path) {
    var session = new Soup.Session ();
    var url = "http://angkit.ktsabit.com/static/%s".printf (path);
    var msg = new Soup.Message ("GET", url);
    Bytes response;
    try {
        response = session.send_and_read(msg);
    }
    catch (Error e){
        print("%s\n", e.message);
        return;
    }

    var image_data = response.get_data ();
    string filepath = "%s/angkit/%s".printf (Environment.get_user_data_dir(), path);
    print(filepath);
    File local_file = File.new_for_path(filepath);
    try {
        FileOutputStream fos = local_file.replace (null, false, FileCreateFlags.NONE);
        fos.write (image_data, null);
    } catch (Error e) {
        print("%s\n", e.message);
    }
}

File getImage (string path) {
    string filepath = "%s/angkit/%s".printf (Environment.get_user_data_dir(), path);
    File local_file = File.new_for_path(filepath);
    if (!local_file.query_exists ()) {
        saveImage (path);
    }
    return local_file;
}