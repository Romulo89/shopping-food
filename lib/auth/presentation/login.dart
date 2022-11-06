import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_food/restaurante/presentation/listagem.dart';

import '../model/usuario.dart';

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
      backgroundColor: const Color(0xFF595959),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image.network(''),
                const SizedBox(height: 400),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Login'),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          validator: usuario.validateLogin,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            label: Text('Senha'),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          validator: usuario.validateSenha,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: verifyLogin,
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
    Navigator.of(context).pushReplacementNamed(RestauranteListagem.route);
  }
}
