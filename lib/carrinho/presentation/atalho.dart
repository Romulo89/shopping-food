import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/carrinho/application/carrinho_provider.dart';
import 'package:shopping_food/carrinho/presentation/detalhes.dart';

class CarrinhoIcon extends StatelessWidget {
  const CarrinhoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final qtd = context.watch<CarrinhoProvider>().value.quantidadeTotal;
    const icon = Icon(Icons.shopping_cart);
    final stack = Stack(children: [
      icon,
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          qtd.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
    ]);
    return IconButton(
      icon: qtd > 0 ? stack : icon,
      onPressed: () => Navigator.of(context).pushNamed(CarrinhoDetalhes.route),
    );
  }
}
