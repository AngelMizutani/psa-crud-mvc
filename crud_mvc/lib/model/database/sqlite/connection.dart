import 'package:crud_mvc/model/database/sqlite/scripts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? banco;

  static Future<Database> get() async {
    if (banco == null) {
      var caminho = join(await getDatabasesPath(), 'banco.db');

      banco = await openDatabase(caminho, version: 1, onCreate: (db, version) {
        db.execute(criarTabelaPet);
        db.execute(inserirPet1);
        db.execute(inserirPet2);
      });
    }
    return banco!;
  }
}
