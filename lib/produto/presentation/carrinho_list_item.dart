import 'package:flutter/material.dart';
import 'package:shopping_food/carrinho/domain/carrinho.dart';
import 'package:shopping_food/carrinho/presentation/quantidade_controll.dart';
import 'package:shopping_food/shared/double_extensions.dart';

class CarrinhoListItem extends StatelessWidget {
  const CarrinhoListItem({Key? key, required this.item}) : super(key: key);
  final ItemCarrinho item;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(7),
      child: Row(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 150),
            child: Image.network(item.produto.image),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item.produto.nome,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    item.produto.preco.dinheiro,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          QuantidadeControl(item: item),
        ],
      ),
    );
  }
}
