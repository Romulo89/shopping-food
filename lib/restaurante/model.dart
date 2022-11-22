class Restaurante {
  Restaurante({
    required this.id,
    required this.nome,
    required this.image,
    this.produtos = const [],
  });
  String id;
  String nome;
  String image;
  List<String> produtos;
}
