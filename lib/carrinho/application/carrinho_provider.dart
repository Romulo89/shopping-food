import 'package:flutter/widgets.dart';
import '../../produto/domain/produto.dart';
import '../domain/carrinho.dart';

class CarrinhoProvider extends ValueNotifier<Carrinho> {
  CarrinhoProvider(super.value);

  adicionarProduto(Produto produto) {
    value.adicionarProduto(produto);
    notifyListeners();
  }

  removerProduto(Produto produto) {
    value.removerProduto(produto);
    notifyListeners();
  }
}
