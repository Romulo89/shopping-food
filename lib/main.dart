import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/model/usuario.dart';
import 'auth/presentation/login.dart';
import 'carrinho/application/carrinho_provider.dart';
import 'carrinho/domain/carrinho.dart';
import 'carrinho/presentation/detalhes.dart';
import 'produto/presentation/detalhes.dart';
import 'restaurante/application/detalhes_store.dart';
import 'restaurante/application/listagem_store.dart';
import 'restaurante/presentation/detalhes.dart';
import 'restaurante/presentation/listagem.dart';

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
        ChangeNotifierProvider<CarrinhoProvider>(
          create: (_) => CarrinhoProvider(
            Carrinho(itens: []),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFF393939),
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
