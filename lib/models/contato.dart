class Contato {
  final String nome;
  final String numero;

  Contato(this.nome, this.numero);

  @override
  String toString() {
    return "Contato: {nome: $nome -> número: $numero}";
  }
}
