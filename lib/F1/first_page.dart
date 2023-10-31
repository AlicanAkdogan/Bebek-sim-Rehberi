import 'package:bebek_isim_rehberi/F1/Name.dart';
import 'package:bebek_isim_rehberi/Namedao.dart';
import 'package:flutter/material.dart';

class first_page extends StatefulWidget {
  const first_page({super.key});

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {
  Future<List<Name>> tumIsimleriGoster() async {
    var isimlerListesi = await Namedao().tumIsimler();
    return isimlerListesi;
  }

  Future<void> fav(int name_id, fav) async {
    await Namedao().favGuncelleme(name_id, fav);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 196, 216, 1),
        title: Text(
          "Popüler Bebek İsimleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Name>>(
        future: tumIsimleriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var isimlerListesi = snapshot.data;
            return ListView.builder(
              itemCount: isimlerListesi!.length,
              itemBuilder: (context, index) {
                var isim = isimlerListesi[index];
                return GestureDetector(
                  onTap: () {
                    //print("Ad = ${isim.name}");
                    //Cardview tıklama
                  },
                  child: SizedBox(
                    height: 130,
                    child: Card(
                      color: Color.fromRGBO(255, 196, 216, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 100,
                                    child: Text(
                                      isim.name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    isim.name_explanation,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            //Fav İcon button eklendi.
                            icon: Icon(Icons.favorite,
                                color: isim.fav == '0'
                                    ? Colors.black
                                    : Colors.red),
                            onPressed: () {
                              setState(() {
                                if (isim.fav == "0") {
                                  //print("Favori 1");

                                  fav(isim.name_id, "1");
                                  print("${isim.name} Favoriye Eklendi");
                                } else if (isim.fav == "1") {
                                  //print("Favori 2");
                                  fav(isim.name_id, "0");
                                  print("${isim.name} Favoriden Çıkarıldı");
                                } else {
                                  print("Bilinmedik bir hat oluştu");
                                }
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
