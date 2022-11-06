import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../carrinho/application/carrinho_provider.dart';
import '../../carrinho/presentation/atalho.dart';
import '../../restaurante/model.dart';
import '../../shared/double_extensions.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
              child: Image.network(
                produto.image,
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 60),
              child: Container(
                padding: const EdgeInsets.all(40),
                constraints: const BoxConstraints(maxHeight: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      produto.nome,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(produto.preco.dinheiro),
                    Text(produto.descricao),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.all(15)),
                            onPressed: () => context
                                .read<CarrinhoProvider>()
                                .adicionarProduto(produto),
                            child: const Text('Adicionar ao Carrinho'),
                          ),
                        ],
                      ),
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
