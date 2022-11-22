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
          constraints: const BoxConstraints(maxHeight: 250),
          child: Image.network(restaurante.image),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(
        RestauranteDetalhes.route,
        arguments: {'restaurante': restaurante},
      ),
    );
  }
}
