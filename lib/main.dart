import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/model/usuario.dart';
import 'auth/presentation/login.dart';
import 'auth/presentation/registrar.dart';
import 'carrinho/application/carrinho_provider.dart';
import 'carrinho/domain/carrinho.dart';
import 'carrinho/presentation/detalhes.dart';
import 'produto/presentation/detalhes.dart';
import 'restaurante/application/detalhes_store.dart';
import 'restaurante/application/listagem_store.dart';
import 'restaurante/model.dart';
import 'restaurante/presentation/detalhes.dart';
import 'restaurante/presentation/listagem.dart';
import 'shopping/application/selecao_store.dart';
import 'shopping/application/shopping_provider.dart';
import 'shopping/presentation/selecao.dart';

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
        ChangeNotifierProvider<ShoppingProvider>(
          create: (_) => ShoppingProvider(),
        ),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ))),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            )),
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
            SelecaoShopping.route: (_) => SelecaoShopping(
                  store: SelecaoShoppingStore(),
                ),
            RegistrarTela.route: (_) => const RegistrarTela(),
          };
          final builder = routes[settings.name];
          if (builder == null) {
            return MaterialPageRoute(
              builder: (context) => Scaffold(
                body: Center(
                    child: Text(
                  'Nao Encontrado',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                      ),
                )),
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
