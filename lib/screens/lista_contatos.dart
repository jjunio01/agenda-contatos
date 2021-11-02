import 'package:agenda/screens/formulario_contatos.dart';
import 'package:flutter/material.dart';

const _appBarTitulo = "Lista de Contatos";
const _nomeContato = "Nome";
const _numeroContato = "Número";

class ListaContatos extends StatelessWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitulo),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text(
                _nomeContato,
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                _numeroContato,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
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
