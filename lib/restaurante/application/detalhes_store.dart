import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_food/produto/domain/produto.dart';

import '../model.dart';

class RestauranteDetalhesStore {
  Future<List<Produto>> getProdutos(Restaurante restaurante) async {
    final database = FirebaseFirestore.instance;
    final list = <Produto>[];
    for (final id in restaurante.produtos) {
      final map = (await database.doc('/produtos/$id').get()).data();
      list.add(Produto(
          nome: map!['nome'],
          descricao: map['descricao'],
          preco: map['preco'] is int ? (map['preco']).toDouble() : map['preco'],
          calorias: map['calorias'],
          image: map['imagem']));
    }
    return list;
  }
}
