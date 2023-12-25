

public class Distributor {
    
    public string nama;
    public string lokasi;
    public string id;

    public Distributor(Json.Object? json) {
        if (json == null) {
            return;
        }
        this.nama = json.get_string_member ("nama");
        this.lokasi = json.get_string_member ("lokasi");
        this.id = json.get_string_member ("id");
    }

}