import 'package:agenda/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'package:agenda/database/app_database.dart';

class ContatoDAO {
  static const _tableSql = "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,"
      "nome TEXT,"
      "numero TEXT)";

  static const String _tableName = "contatos";

  Future<int> save(Contato contato) async {
    final Database db = await getDataBase(_tableSql);
    return db.insert(_tableName, contato.toMap());
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDataBase(_tableSql);
    final List<Map<String, dynamic>> listaContatos = await db.query(_tableName);
    return _toList(listaContatos);
  }

  List<Contato> _toList(List<Map<String, dynamic>> listaContatos) {
    final List<Contato> contatos = [];
    for (Map<String, dynamic> contatoDB in listaContatos) {
      final Contato contato = Contato(
        id: contatoDB["id"],
        nome: contatoDB["nome"],
        numero: contatoDB["numero"],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
