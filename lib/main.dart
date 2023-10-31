import 'package:bebek_isim_rehberi/F1/first_page.dart';
import 'package:bebek_isim_rehberi/F2/secound_page.dart';
import 'package:bebek_isim_rehberi/F3/third_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pageList = [first_page(), secound_page(), third_page()];
  int startIndeks = 0; //0 - 1 - 2 ilk açılacak olan sayfa seçimi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[startIndeks],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromRGBO(255, 196, 216, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "İsimler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoriler",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ayarlar",
          ),
        ],
        currentIndex: startIndeks,
        onTap: (value) {
          //print("Bottom Click");
          setState(() {
            startIndeks = value;
          });
        },
      ),
    );
  }
}
