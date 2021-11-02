class Contato {
  final String nome;
  final String numero;

  Contato({
    required this.nome,
    required this.numero,
  });

  @override
  String toString() {
    return "Contato: {nome: $nome -> número: $numero}";
  }
}
