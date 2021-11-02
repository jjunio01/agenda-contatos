import 'package:agenda/database/app_database.dart';
import 'package:agenda/models/contato.dart';
import 'package:agenda/screens/formulario_contatos.dart';
import 'package:flutter/material.dart';

const _appBarTitulo = "Lista de Contatos";

class ListaContatos extends StatelessWidget {
  final List<Contato> contatos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitulo),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando"),
                  ],
                ),
              );
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contato> contatosDB = snapshot.data as List<Contato>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contatoDB = contatosDB[index];
                  return _itemLista(contatoDB);
                },
                itemCount: contatosDB.length,
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const FormularioContatos(),
                ),
              )
              .then((novoContato) => debugPrint(
                    novoContato.toString(),
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _itemLista extends StatelessWidget {
  final Contato contato;

  const _itemLista(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numero,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
