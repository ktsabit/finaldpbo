

public class Distributor {
    
    string? nama;
    string? lokasi;
    string? id;

    public Distributor(Json.Object? json) {
        if (json == null) {
            return;
        }
        this.nama = json.get_string_member ("nama");
        this.lokasi = json.get_string_member ("lokasi");
        this.id = json.get_string_member ("id");
    }

}