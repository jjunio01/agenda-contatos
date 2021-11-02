class Contato {
  final int id;
  final String nome;
  final String numero;

  Contato({
    required this.id,
    required this.nome,
    required this.numero,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'numero': numero,
    };
  }

  @override
  String toString() {
    return "Contato: {id: $id, nome: $nome -> número: $numero}";
  }
}
