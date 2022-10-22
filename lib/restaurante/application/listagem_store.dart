import 'package:shopping_food/restaurante/model.dart';

class ListagemRestaurantesStore {
  Future<List<Restaurante>> getRestaurantes() async {
    return [
      Restaurante(
          image:
              'https://marcas-logos.net/wp-content/uploads/2020/02/McDonalds-logo-1.png',
          nome: 'R1'),
      Restaurante(
          image:
              'https://marcas-logos.net/wp-content/uploads/2020/02/McDonalds-logo-1.png',
          nome: 'R2'),
      Restaurante(
          image:
              'https://marcas-logos.net/wp-content/uploads/2020/02/McDonalds-logo-1.png',
          nome: 'R3'),
      Restaurante(
          image:
              'https://marcas-logos.net/wp-content/uploads/2020/02/McDonalds-logo-1.png',
          nome: 'R4'),
      Restaurante(
          image:
              'https://marcas-logos.net/wp-content/uploads/2020/02/McDonalds-logo-1.png',
          nome: 'R5'),
      Restaurante(
          image:
              'https://marcas-logos.net/wp-content/uploads/2020/02/McDonalds-logo-1.png',
          nome: 'R6'),
    ];
  }
}
