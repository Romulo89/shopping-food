class Usuario {
  String login;
  String senha;
  Usuario({
    required this.login,
    required this.senha,
  });

  String? validateSenha(String? senha) {
    if (senha == null) return 'Digitar uma senha';
    if (senha.length < 8) {
      return 'Senha deve conter mais de 8 caracteres';
    }
    if (!senha.contains(RegExp(r'[A-Z]+'))) {
      return 'Senha deve conter letras maiusculas';
    }
    if (!senha.contains(RegExp(r'[a-z]+'))) {
      return 'Senha deve conter letras minusculas';
    }
    if (!senha.contains(RegExp(r'\d'))) {
      return 'Senha deve conter numeros';
    }
    return null;
  }

  String? validateLogin(String? login) {
    return null;
  }
}
