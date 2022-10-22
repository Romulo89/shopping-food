class Produto {
  String nome;
  String descricao;
  double preco;
  int calorias;
  String image;

  Produto({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.calorias,
    required this.image,
  });

  String get formatCalorias => '$calorias kcal';
  String get formatPreco => 'R\$${preco.toStringAsFixed(2)}';
}
