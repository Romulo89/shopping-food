import 'package:cloud_firestore/cloud_firestore.dart';

import '../../shopping/model/shopping.dart';
import '../model.dart';

class ListagemRestaurantesStore {
  Future<List<Restaurante>> getRestaurantes(Shopping shopping) async {
    final database = FirebaseFirestore.instance;
    final list = <Restaurante>[];
    for (var id in shopping.restaurantes) {
      final obj = (await database.doc('restaurantes/$id').get()).data();
      list.add(Restaurante(
        id: id,
        nome: obj!['nome'],
        image: obj['imagem'],
        produtos: (obj['produtos'] as List).cast<String>(),
      ));
    }
    return list;
  }
}
