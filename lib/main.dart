import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
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

Future<void> main() async {
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
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            )),
        onGenerateRoute: (settings) {
          final args = settings.arguments as Map<String, dynamic>?;
          final routes = <String, WidgetBuilder>{
            '/': (_) => const MainLoader(),
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

class MainLoader extends StatefulWidget {
  const MainLoader({super.key});

  @override
  State<MainLoader> createState() => _MainLoaderState();
}

class _MainLoaderState extends State<MainLoader> {
  bool loaded = false;
  @override
  void initState() {
    super.initState();

    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => setState(() => loaded = true));
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      Future.microtask(
        () => Navigator.of(context).pushReplacementNamed(Login.route),
      );
    }
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
