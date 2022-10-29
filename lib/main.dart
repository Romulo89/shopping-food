import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/auth/model/usuario.dart';
import 'package:shopping_food/carrinho/presentation/detalhes.dart';
import 'package:shopping_food/restaurante/application/listagem_store.dart';
import 'package:shopping_food/restaurante/presentation/detalhes.dart';
import 'package:shopping_food/restaurante/presentation/listagem.dart';

import 'auth/presentation/login.dart';
import 'carrinho/domain/carrinho.dart';
import 'produto/presentation/detalhes.dart';
import 'restaurante/application/detalhes_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Usuario(login: '', senha: '')),
        Provider(create: (_) => Carrinho(itens: [])),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        initialRoute: Login.route,
        onGenerateRoute: (settings) {
          final args = settings.arguments as Map<String, dynamic>?;
          final routes = <String, WidgetBuilder>{
            Login.route: (_) => const Login(),
            RestauranteListagem.route: (_) =>
                RestauranteListagem(store: ListagemRestaurantesStore()),
            RestauranteDetalhes.route: (_) => RestauranteDetalhes(
                restaurante: args!['restaurante'],
                store: RestauranteDetalhesStore()),
            ProdutoDetalhes.route: (_) => ProdutoDetalhes(
                  produto: args!['produto'],
                  restaurante: args['restaurante'],
                ),
            CarrinhoDetalhes.route: (_) => const CarrinhoDetalhes(),
          };
          final builder = routes[settings.name];
          if (builder == null) {
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text('Nao Encontrado')),
              ),
            );
          } else {
            return MaterialPageRoute(builder: builder);
          }
        },
      ),
    );
  }
}
