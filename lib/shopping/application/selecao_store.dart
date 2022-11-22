import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cidade.dart';
import '../model/shopping.dart';

class SelecaoShoppingStore {
  Future<List<Cidade>> getCidades() async {
    final database = FirebaseFirestore.instance;
    final shoppings = await database.collection('cidades').get();
    final list = <Cidade>[];
    for (DocumentSnapshot s in shoppings.docs) {
      final map = s.data() as Map<String, dynamic>;
      final shps = (map['shoppings'] as List).cast<String>();
      list.add(Cidade(
        id: s.id,
        nome: map['nome'],
        shoppings: shps,
      ));
    }
    return list;
  }

  Future<List<Shopping>> getShoppings(Cidade cidade) async {
    final database = FirebaseFirestore.instance;
    final list = <Shopping>[];
    for (var id in cidade.shoppings) {
      final map = (await database.doc('/shoppings/$id').get()).data();
      list.add(Shopping(
        id: id,
        nome: map!['nome'],
        restaurantes: (map['restaurantes'] as List).cast<String>(),
      ));
    }
    return list;
  }
}
