import 'package:flutter/material.dart';

import '../model/cidade.dart';
import '../model/shopping.dart';

class ShoppingProvider extends ChangeNotifier {
  Shopping? shop;
  late Cidade city;
  final List<DropdownMenuItem<Shopping>> shoppings = [];
  final List<DropdownMenuItem<Cidade>> cidades = [];

  void updateShop(Shopping? value) {
    if (value != null) shop = value;
  }

  void setCidades(List<Cidade> value) {
    cidades.clear();
    cidades.addAll(
      value.map(
        (e) => DropdownMenuItem<Cidade>(
          value: e,
          child: Text(e.nome),
        ),
      ),
    );
    notifyListeners();
  }

  Future<void> setShoppings(Function getShoppings) async {
    shop = null;
    shoppings.clear();
    List<Shopping> value = await getShoppings();
    notifyListeners();
    if (value.isNotEmpty) {
      shoppings.addAll(
        value
            .map(
              (e) => DropdownMenuItem<Shopping>(
                value: e,
                child: Text(e.nome),
              ),
            )
            .toList(),
      );
    }
    notifyListeners();
  }

  void updateCidade(Cidade cidade) {
    city = cidade;
    shop = null;
    notifyListeners();
  }
}
