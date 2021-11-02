import 'package:agenda/models/contato.dart';
import 'package:agenda/screens/formulario_contatos.dart';
import 'package:flutter/material.dart';

const _appBarTitulo = "Lista de Contatos";

class ListaContatos extends StatelessWidget {

  final List<Contato> contatos = [];

  @override
  Widget build(BuildContext context) {
    contatos.add(Contato(id: 0, nome: "Junio", numero: "0800"));
    contatos.add(Contato(id: 0, nome: "Teste", numero: "0900"));
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitulo),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contato contato = contatos[index];
          return _itemLista(contato);
        },
        itemCount: contatos.length,
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
