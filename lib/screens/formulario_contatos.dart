import 'package:agenda/database/app_database.dart';
import 'package:agenda/models/contato.dart';
import 'package:flutter/material.dart';

const _appBarTitulo = "Novo Contato";

class FormularioContatos extends StatefulWidget {
  const FormularioContatos({Key? key}) : super(key: key);

  @override
  State<FormularioContatos> createState() => _FormularioContatosState();
}

class _FormularioContatosState extends State<FormularioContatos> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _appBarTitulo,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome",
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numeroController,
                decoration: const InputDecoration(
                  labelText: "Número",
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String nomeContato = _nomeController.text;
                    final String numeroContato = _numeroController.text;
                    Contato novoContato = Contato(
                      id: 0,
                      nome: nomeContato,
                      numero: numeroContato,
                    );
                    save(novoContato).then((id) => Navigator.pop(
                          context,
                        ));
                  },
                  child: const Text("Adicionar"),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
