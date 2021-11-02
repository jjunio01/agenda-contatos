import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void createDataBase() async {
  final path = await getDatabasesPath();
  openDatabase(
    join(path, "agenda.db"),
    onCreate: (db, version) {
      return db.execute("CREATE TABLE contatos(id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "numero TEXT");
    },
    version: 1,
  );
}
