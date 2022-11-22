import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../produto/presentation/carrinho_list_item.dart';
import '../application/carrinho_provider.dart';
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
    final carrinho = context.watch<CarrinhoProvider>();
    final produtos = List<Widget>.generate(
      carrinho.value.itens.length,
      (index) {
        var item = carrinho.value.itens[index];
        return CarrinhoListItem(item: item);
      },
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: produtos
              ..add(const CarrinhoResumo())
              ..add(
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => print('Finalizado'),
                    child: const Text('Finalizar'),
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
}
