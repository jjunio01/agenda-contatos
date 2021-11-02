import 'package:agenda/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, "agenda.db");
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute("CREATE TABLE contatos(id INTEGER PRIMARY KEY,"
            "nome TEXT,"
            "numero TEXT)");
      },
      version: 1,
    );
  });
}

void save(Contato contato) {
  createDataBase().then((db) {
    final Map<String, dynamic> contatoMap = <String, dynamic>{};
    contatoMap['nome'] = contato.nome;
    contatoMap["numero"] = contato.numero;
    db.insert("contatos", contatoMap);
  });
}

Future<List<Contato>> findAll() {
  return createDataBase().then((db) {
    return db.query("contatos").then((maps) {
      final List<Contato> contatos = [];
      for (Map<String, dynamic> map in maps) {
        final Contato contato = Contato(
          id: map["id"],
          nome: map["nome"],
          numero: map["numero"],
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}
