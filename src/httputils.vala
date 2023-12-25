string bytesToStr (Bytes bytes) {
    return (string) bytes.get_data ();
}

Bytes strToBytes (string str) {
    uint8[] chr = (uint8[]) str.to_utf8 ();
    Bytes bytes = new Bytes.take (chr);
    return bytes;
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


