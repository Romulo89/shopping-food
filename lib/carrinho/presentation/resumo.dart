import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/carrinho/domain/carrinho.dart';
import 'package:shopping_food/shared/double_extensions.dart';

class CarrinhoResumo extends StatelessWidget {
  const CarrinhoResumo({super.key});
  @override
  Widget build(BuildContext context) {
    final carrinho = context.read<Carrinho>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal:',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
              Text(
                'R\$${carrinho.subtotal.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Desconto:',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
              Text(
                carrinho.desconto.dinheiro,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total:',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
              Text(
                carrinho.total.dinheiro,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
