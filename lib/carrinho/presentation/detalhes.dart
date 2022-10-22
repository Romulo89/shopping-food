import 'package:flutter/material.dart';

class CarrinhoDetalhes extends StatelessWidget {
  const CarrinhoDetalhes({super.key});
  static const String route = '/Carrinho';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: const Center(
        child: Text('Produtos'),
      ),
    );
  }
}
