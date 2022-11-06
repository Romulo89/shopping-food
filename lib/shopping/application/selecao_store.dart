import '../model/cidade.dart';
import '../model/shopping.dart';

class SelecaoShoppingStore {
  Future<List<Cidade>> getCidades() async {
    // TODO Busca no servidor
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Cidade(id: 8, nome: 'Curitiba'),
      Cidade(id: 9, nome: 'Maringa'),
    ];
  }

  Future<List<Shopping>> getShoppings(Cidade cidade) async {
    // TODO Busca no servidor
    await Future.delayed(const Duration(milliseconds: 500));
    return cidade.id == 8
        ? [
            Shopping(id: 11, nome: 'Curitiba'),
            Shopping(id: 13, nome: 'Cidade'),
            Shopping(id: 12, nome: 'Ventura'),
          ]
        : [
            Shopping(id: 21, nome: 'Cidade'),
          ];
  }
}
