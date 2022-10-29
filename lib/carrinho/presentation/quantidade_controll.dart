import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/carrinho/domain/carrinho.dart';

class QuantidadeControl extends StatelessWidget {
  const QuantidadeControl({super.key, required this.item});
  final ItemCarrinho item;
  @override
  Widget build(BuildContext context) {
    final carrinho = context.watch<Carrinho>();
    return Column(
      children: [
        IconButton(
          onPressed: () => carrinho.adicionarProduto(item.produto),
          icon: const Icon(Icons.add),
        ),
        Text(item.quantidade.toString()),
        IconButton(
          onPressed: () => carrinho.removerProduto(item.produto),
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
