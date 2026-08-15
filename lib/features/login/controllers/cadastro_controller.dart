class CadastroController {
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _regexSenha = RegExp(
    r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
  );

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaSpecialCharacterValid => _regexSenha.hasMatch(senha.trim());
  bool get isSenhaLengthValid => senha.trim().length >= 6;

  String? get emailError {
    if (email.trim().isEmpty) {
      return null;
    }

    if (!_emailRegex.hasMatch(email.trim())) {
      return 'Email inválido';
    }
  }

  String? get senhaError {
    if (senha.trim().isEmpty) {
      return null;
    } else if (!isSenhaLengthValid) {
      return 'Senha deve ter no mínimo 6 caractéres';
    } else if (!isSenhaSpecialCharacterValid) {
      return 'Senha deve conter pelo menos uma letra maiúscula \n e um caractere especial';
    }
  }

  String? get confirmarSenhaError {
    if (confirmarSenha.trim().isEmpty) {
      return null;
    } else if (senha != confirmarSenha) {
      return 'As senhas não coincidem';
    }
  }

  void validFields() {
    isActiveButton =
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty &&
        isActiveCheckBox;

    print(isActiveButton);
  }

  void setSenha(String value) {
    senha = value;
    validFields();
  }

  void setConfirmarSenha(String value) {
    confirmarSenha = value;
    validFields();
  }

  void setEmail(String value) {
    email = value;
    validFields();
  }

  void setNome(String value) {
    nome = value;
    validFields();
  }

  void changeActiveCheckBox(bool value) {
    isActiveCheckBox = !isActiveCheckBox;
    validFields();
  }
}
