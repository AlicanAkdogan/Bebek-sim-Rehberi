import 'package:bebek_isim_rehberi/F3/Settings.dart';
import 'package:flutter/material.dart';

class third_page extends StatefulWidget {
  const third_page({super.key});

  @override
  State<third_page> createState() => _third_pageState();
}

class _third_pageState extends State<third_page> {
  Future<List<Settings>> allSettingsShow() async {
    var settingsList = <Settings>[];

    var s1 = Settings(1, "Uygulamamızı Değerlendir", "star.png");
    var s2 = Settings(2, "Uygulama Sürümü", "information.png");
    var s3 = Settings(3, "İletişim", "contact.png");

    settingsList.add(s1);
    settingsList.add(s2);
    settingsList.add(s3);

    return settingsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 196, 216, 1),
        title: Text(
          "Ayarlar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Settings>>(
        future: allSettingsShow(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var ayarlarListesi = snapshot.data;
            return ListView.builder(
              itemCount: ayarlarListesi!.length,
              itemBuilder: (context, index) {
                var ayar = ayarlarListesi[index];
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      print("Uygulama değerlendirmeye tıklandı");
                    } else if (index == 1) {
                      //print("Uygulama Sürümüne Tıklandı");
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Uygulama Sürümü"),
                              content: Text("1.0.0"),
                              actions: [
                                TextButton(
                                  child: Text("Kapat"),
                                  onPressed: () {
                                    //print("İptal Tıklandı");
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    } else if (index == 2) {
                      //print("İletişime tıklandı");
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("İletişim"),
                              content: Text("Mail : alican@aynadakiyazar.com"),
                              actions: [
                                TextButton(
                                  child: Text("Kapat"),
                                  onPressed: () {
                                    //print("İptal Tıklandı");
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    }
                  },
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      color: Color.fromRGBO(255, 196, 216, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.asset(
                                "images/${ayar.settings_icon}",
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              ayar.settings_name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            print("Veri Gelmedi");
            return Center();
          }
        },
      ),
    );
  }
}
