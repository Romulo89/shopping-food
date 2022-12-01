import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../restaurante/presentation/listagem.dart';
import '../application/selecao_store.dart';
import '../application/shopping_provider.dart';
import '../model/cidade.dart';
import '../model/shopping.dart';

class SelecaoShopping extends StatefulWidget {
  const SelecaoShopping({super.key, required this.store});
  static const String route = '/shopping';
  final SelecaoShoppingStore store;
  @override
  State<SelecaoShopping> createState() => _SelecaoShoppingState();
}

class _SelecaoShoppingState extends State<SelecaoShopping> {
  late ShoppingProvider provider;
  @override
  void initState() {
    super.initState();
    widget.store.getCidades().then((value) {
      context.read<ShoppingProvider>().setCidades(value);
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white70,
        );
    provider = context.read<ShoppingProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping')),
      body: Form(
        key: formKey,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 300),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Selecionar uma Cidade', style: style),
              DropdownButtonFormField<Cidade>(
                items: context.watch<ShoppingProvider>().cidades,
                validator: (value) =>
                    (value == null) ? 'Selecionar uma cidade' : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (cidade) async {
                  if (cidade == null) return;
                  provider.updateCidade(cidade);
                  provider.setShoppings(
                    () async => await widget.store.getShoppings(provider.city),
                  );
                },
              ),
              Text('Selecionar um Restaurante:', style: style),
              if (provider.shoppings.isEmpty)
                const SizedBox(height: 1)
              else
                DropdownButtonFormField<Shopping>(
                  items: context.watch<ShoppingProvider>().shoppings,
                  validator: (value) =>
                      (value == null) ? 'Selecionar um shopping' : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onChanged: (shop) {
                    provider.shop = shop;
                  },
                ),
              ElevatedButton(
                onPressed: validateForm,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, shape: const StadiumBorder()),
                child: const Text('Restaurantes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateForm() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Navigator.of(context).pushNamed(RestauranteListagem.route);
  }
}
