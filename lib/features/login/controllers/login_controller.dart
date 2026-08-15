import 'dart:math';

class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _regexSenha = RegExp(
    r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
  );
  String email = '';
  String senha = '';

  bool lembrarMe = false;
  bool isActiveButton = false;
  bool isLoading = false;
  bool isActiveCheckBox = false;

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

  void validFields() {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
  }

  void validEmail(String email) {}

  void setSenha(String value) {
    senha = value;
    validFields();
  }

  void setEmail(String value) {
    email = value;
    validFields();
  }

  void changeActiveButton() {
    validFields();
  }

  void changeActiveCheckBox(bool value) {
    isActiveCheckBox = value;
  }

  Future<void> login() async {
    //Simula o delay de uma chamada de API
    await Future.delayed(Duration(seconds: 2));
  }
}
