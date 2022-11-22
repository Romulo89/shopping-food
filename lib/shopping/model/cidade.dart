class Cidade {
  Cidade({
    required this.id,
    required this.nome,
    this.shoppings = const [],
  });

  String id;
  String nome;
  List<String> shoppings;
}
