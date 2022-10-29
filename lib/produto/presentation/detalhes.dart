import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/shared/double_extensions.dart';

import '../../carrinho/domain/carrinho.dart';
import '../../carrinho/presentation/atalho.dart';
import '../../restaurante/model.dart';
import '../domain/produto.dart';

class ProdutoDetalhes extends StatelessWidget {
  const ProdutoDetalhes(
      {super.key, required this.produto, required this.restaurante});
  static const String route = '/ProdutoDetalhes';
  final Restaurante restaurante;
  final Produto produto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurante.nome),
        actions: const [CarrinhoIcon()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Image.network(
                produto.image,
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(produto.nome),
                  Text(produto.preco.dinheiro),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.all(15)),
                            onPressed: () => context
                                .read<Carrinho>()
                                .adicionarProduto(produto),
                            child: const Text('Adicionar ao Carrinho'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
