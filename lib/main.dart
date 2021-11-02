import 'package:agenda/database/app_database.dart';
import 'package:agenda/models/contato.dart';
import 'package:agenda/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AgendaApp());
  save(Contato(id: 0, nome: "Junio", numero: "9090"));
  findAll().then((contatos) => debugPrint(contatos.toString()));
}

class AgendaApp extends StatelessWidget {
  const AgendaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          secondary: Colors.tealAccent[400],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.tealAccent[400],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const HomePage(),
    );
  }
}
