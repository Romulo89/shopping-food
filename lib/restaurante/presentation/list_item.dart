import 'package:flutter/material.dart';

import '../model.dart';
import 'detalhes.dart';

class ResaturanteListItem extends StatelessWidget {
  const ResaturanteListItem({super.key, required this.restaurante});
  final Restaurante restaurante;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 150,
          child: Image.network(
            restaurante.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(
        RestauranteDetalhes.route,
        arguments: {'restaurante': restaurante},
      ),
    );
  }
}
