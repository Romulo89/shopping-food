import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/carrinho/domain/carrinho.dart';

class QuantidadeControl extends StatefulWidget {
  const QuantidadeControl({super.key, required this.item});
  final ItemCarrinho item;

  @override
  State<QuantidadeControl> createState() => _QuantidadeControlState();
}

class _QuantidadeControlState extends State<QuantidadeControl> {
  @override
  Widget build(BuildContext context) {
    final carrinho = context.watch<Carrinho>();
    return Column(
      children: [
        IconButton(
          onPressed: () => setState(() {
            carrinho.adicionarProduto(widget.item.produto);
          }),
          icon: const Icon(Icons.add),
        ),
        Text(widget.item.quantidade.toString()),
        IconButton(
          onPressed: () => setState(() {
            carrinho.removerProduto(widget.item.produto);
          }),
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
