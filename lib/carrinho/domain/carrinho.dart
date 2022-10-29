// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../produto/domain/produto.dart';

class Carrinho {
  List<ItemCarrinho> itens;
  double desconto;
  Carrinho({
    required this.itens,
    this.desconto = 0,
  });

  void adicionarProduto(Produto produto) {
    try {
      var existente = itens.firstWhere((element) => element.produto == produto);
      existente.quantidade++;
    } catch (_) {
      itens.add(ItemCarrinho(quantidade: 1, produto: produto));
    }
  }

  removerProduto(Produto produto) {
    try {
      var existente = itens.firstWhere((element) => element.produto == produto);
      existente.quantidade--;
    } catch (_) {
      return;
    }
  }

  double get total => subtotal - (subtotal * desconto);

  double get subtotal {
    double total = 0;
    for (var e in itens) {
      total += e.precoTotal;
    }
    return total;
  }
}

class ItemCarrinho {
  int quantidade;
  Produto produto;
  ItemCarrinho({
    required this.quantidade,
    required this.produto,
  });
  double get precoTotal => produto.preco * quantidade;
}
