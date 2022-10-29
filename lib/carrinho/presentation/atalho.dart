import 'package:flutter/material.dart';
import 'package:shopping_food/carrinho/presentation/detalhes.dart';

class CarrinhoIcon extends StatelessWidget {
  const CarrinhoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_cart),
      onPressed: () => Navigator.of(context).pushNamed(CarrinhoDetalhes.route),
    );
  }
}
