import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shopping/presentation/selecao.dart';
import '../model/usuario.dart';
import 'registrar.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String route = '/Login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final Usuario usuario;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    usuario = context.read<Usuario>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/inicio.png'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        initialValue: usuario.login,
                        validator: usuario.validateLogin,
                        decoration: const InputDecoration(
                          label: Text('Login'),
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        initialValue: usuario.senha,
                        validator: usuario.validateSenha,
                        decoration: const InputDecoration(
                          label: Text('Senha'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 13),
                            ),
                            onPressed: verifyLogin,
                            child: const Text('Login'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade900,
                              padding: const EdgeInsets.symmetric(vertical: 13),
                            ),
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed(RegistrarTela.route),
                            child: const Text('Registrar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyLogin() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    // TODO: testar no servidor
    Navigator.of(context).pushReplacementNamed(SelecaoShopping.route);
  }
}
