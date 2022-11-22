class Shopping {
  Shopping({
    required this.id,
    required this.nome,
    this.restaurantes = const [],
  });
  String id;
  String nome;
  List<String> restaurantes;
}
