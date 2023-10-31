import 'package:bebek_isim_rehberi/DatabaseHalper.dart';
import 'package:bebek_isim_rehberi/F1/Name.dart';

class Namedao {
  Future<List<Name>> tumIsimler() async {
    var db = await DatabaseHalper.vertabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM babynames"); // !! kisilerv2 test !!
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      //return Kisiler(satir["kisi_id"], satir["kisi_ad"]);
      return Name(satir["name_id"], satir["name"], satir["name_explanation"],
          satir["fav"]);
    });
  }

  Future<void> favGuncelleme(int name_id, String fav) async {
    var db = await DatabaseHalper.vertabaniErisim();
    var isimler = Map<String, dynamic>();
    isimler["fav"] = fav;

    await db
        .update("babynames", isimler, where: "name_id=?", whereArgs: [name_id]);
  }

  Future<List<Name>> fav() async {
    var db = await DatabaseHalper.vertabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM babynames WHERE fav='1' ");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      //return Kisiler(satir["kisi_id"], satir["kisi_ad"]);
      return Name(satir["name_id"], satir["name"], satir["name_explanation"],
          satir["fav"]);
    });
  }
}
