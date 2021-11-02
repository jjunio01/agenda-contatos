import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase(String createTable) async {
  final String path = join(await getDatabasesPath(), "agenda.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(createTable);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
