import 'package:flutter/material.dart';
import 'package:shopping_food/produto/presentation/detalhes.dart';
import 'package:shopping_food/restaurante/model.dart';
import 'package:shopping_food/shared/double_extensions.dart';

import '../domain/produto.dart';

class ProdutoListItem extends StatelessWidget {
  const ProdutoListItem({Key? key, required this.produto, this.restaurante})
      : super(key: key);
  final Restaurante? restaurante;
  final Produto produto;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ProdutoDetalhes.route,
        arguments: {
          'produto': produto,
          'restaurante': restaurante,
        },
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(7),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 150),
              child: Image.network(produto.image),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      produto.nome,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      produto.descricao,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      produto.preco.dinheiro,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
