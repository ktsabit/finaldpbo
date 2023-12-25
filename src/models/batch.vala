public class Batch {

    public string id;
    public string nama;
    public string jenis_ternak;
    public string spesies;
    public string tgl_mulai;
    public string tgl_kemas;
    public string tgl_potong;
    public double berat_rt_sample;
    public Distributor distributor;
    public Peternakan peternak;

    public Batch(Json.Object? json) {
        if (json == null) {
            return;
        }
        this.id = json.get_string_member ("id");
        this.nama = json.get_string_member ("nama");
        this.jenis_ternak = json.get_string_member ("jenis_ternak");
        this.spesies = json.get_string_member ("spesies");
        this.tgl_mulai = json.get_string_member ("tgl_mulai");
        this.tgl_kemas = json.get_string_member ("tgl_kemas");
        this.tgl_potong = json.get_string_member ("tgl_potong");
        this.berat_rt_sample = json.get_double_member ("berat_rt_sample");
        this.distributor = new Distributor (json.get_object_member ("distributor"));
        this.peternak = new Peternakan (json.get_object_member ("peternak"));

    }


}
