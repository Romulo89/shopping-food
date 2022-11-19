import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/usuario.dart';
import 'login.dart';

class RegistrarTela extends StatefulWidget {
  static const String route = '/registrar';

  const RegistrarTela({super.key});

  @override
  State<RegistrarTela> createState() => _RegistrarTelaState();
}

class _RegistrarTelaState extends State<RegistrarTela> {
  late final Usuario usuario;
  @override
  void initState() {
    super.initState();
    usuario = context.read<Usuario>();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar')),
      body: Form(
        key: formKey,
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Login'),
                ),
                validator: usuario.validateLogin,
                onSaved: (login) => usuario.login = login ?? '',
                initialValue: usuario.login,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
                validator: usuario.validateSenha,
                onSaved: (senha) => usuario.senha = senha ?? '',
                initialValue: usuario.senha,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                ),
                onPressed: verifyRegister,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyRegister() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    Navigator.of(context).pushReplacementNamed(Login.route);
  }
}
