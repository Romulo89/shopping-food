import 'package:flutter/material.dart';

import '../../carrinho/presentation/atalho.dart';
import '../../produto/domain/produto.dart';
import '../../produto/presentation/list_item.dart';
import '../application/detalhes_store.dart';
import '../model.dart';

class RestauranteDetalhes extends StatefulWidget {
  const RestauranteDetalhes(
      {super.key, required this.restaurante, required this.store});
  static const String route = '/RestauranteDetalhes';
  final Restaurante restaurante;
  final RestauranteDetalhesStore store;
  @override
  State<RestauranteDetalhes> createState() => _RestauranteDetalhesState();
}

class _RestauranteDetalhesState extends State<RestauranteDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurante.nome),
        actions: const [CarrinhoIcon()],
      ),
      body: FutureBuilder<List<Produto>>(
        future: widget.store.getProdutos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(child: Text('erro'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final produto = snapshot.data![index];
              return ProdutoListItem(
                produto: produto,
                restaurante: widget.restaurante,
              );
            },
          );
        },
      ),
    );
  }
}
