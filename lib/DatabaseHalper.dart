import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHalper {
  static final String veritabaniAdi = "BabyNames.db";

  static Future<Database> vertabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

    if (await databaseExists(veritabaniYolu)) {
      print("Veritabanı zaten var, kopyalamaya gerek yok");
    } else {
      ByteData data = await rootBundle.load("database/$veritabaniAdi");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veritabnı kopyalandı");
    }

    return openDatabase(veritabaniYolu);
  }
}
