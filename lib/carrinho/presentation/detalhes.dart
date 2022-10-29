import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/carrinho/domain/carrinho.dart';

import '../../produto/presentation/carrinho_list_item.dart';
import 'resumo.dart';

class CarrinhoDetalhes extends StatefulWidget {
  const CarrinhoDetalhes({super.key});
  static const String route = '/Carrinho';

  @override
  State<CarrinhoDetalhes> createState() => _CarrinhoDetalhesState();
}

class _CarrinhoDetalhesState extends State<CarrinhoDetalhes> {
  @override
  Widget build(BuildContext context) {
    final carrinho = context.watch<Carrinho>();
    final produtos = List<Widget>.generate(
      carrinho.itens.length,
      (index) {
        var item = carrinho.itens[index];
        return CarrinhoListItem(item: item);
      },
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      backgroundColor: const Color(0xFF595959),
      body: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          child: Column(
            children: produtos..add(const CarrinhoResumo()),
          ),
        ),
      ),
    );
  }
}
