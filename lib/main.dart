import 'package:flutter/material.dart';

void main() {
  runApp(const AgendaApp());
}

class AgendaApp extends StatelessWidget {
  const AgendaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Agenda de Contatos"),
        ),
      ),
    );
  }
}
