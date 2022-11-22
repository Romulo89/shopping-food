import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../carrinho/presentation/atalho.dart';
import '../../shopping/application/shopping_provider.dart';
import '../application/listagem_store.dart';
import '../model.dart';
import 'list_item.dart';

class RestauranteListagem extends StatefulWidget {
  const RestauranteListagem({super.key, required this.store});
  final ListagemRestaurantesStore store;
  static const String route = '/RestaurantesListagem';

  @override
  State<RestauranteListagem> createState() => _RestauranteListagemState();
}

class _RestauranteListagemState extends State<RestauranteListagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
        actions: const [CarrinhoIcon()],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FutureBuilder<List<Restaurante>>(
          future: widget.store
              .getRestaurantes(context.read<ShoppingProvider>().shop!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final restaurante = snapshot.data![index];
                return ResaturanteListItem(restaurante: restaurante);
              },
            );
          },
        ),
      ),
    );
  }
}
