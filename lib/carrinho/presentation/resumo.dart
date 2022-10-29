import 'package:flutter/material.dart';
import 'package:shopping_food/carrinho/domain/carrinho.dart';
import 'package:shopping_food/shared/double_extensions.dart';

class CarrinhoResumo extends StatelessWidget {
  const CarrinhoResumo({super.key, required this.carrinho});
  final Carrinho carrinho;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal'),
              Text('R\$${carrinho.subtotal.toStringAsFixed(2)}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Desconto'),
              Text(carrinho.desconto.dinheiro),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total'),
              Text(carrinho.total.dinheiro),
            ],
          ),
        ],
      ),
    );
  }
}
