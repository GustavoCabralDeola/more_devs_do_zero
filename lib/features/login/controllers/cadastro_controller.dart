import 'package:flutter/material.dart';

class CadastroController extends ChangeNotifier {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _regexSenha = RegExp(
    r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String senha = '';
  String confirmarSenha = '';
  bool isActiveButton = false;
  bool isActiveCheckBox = false;
  bool isLoading = false;

  bool get senhaMinimo6 => senha.length >= 6 ? true : false;
  bool get senhaMaiscula => senha.contains(RegExp(r'(?=.*[A-Z])'));
  bool get senhaMinusculo => senha.contains(RegExp(r'(?=.*[a-z])'));
  //bool get senhaCaractereEspecial => senha.contains(RegExp(r'^[A-Za-z0-9]+$'));

  bool get isSenhaSpecialCharacterValid => _regexSenha.hasMatch(senha.trim());
  bool get isSenhaLengthValid => senha.trim().length >= 6;

  bool checkBoxError = false;

  Future<void> handleContinueButton() async {
    if (!validateCheckBox()) {
      return notifyListeners();
    }

    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      await loadingButton();
      isLoading = false;
      notifyListeners();
    }
    //futuramente não será necessário o setState, pois a tela
    // sera reconstruida com o provider
  }

  //=============== VALIDATORS ===============

  String? validEmail(String? value) {
    if (_emailRegex.hasMatch(value!) || value.isEmpty) {
      return null;
    }
    return 'E-mail inválido';
  }

  String? validPassword(String? value) {
    if (isSenhaLengthValid && isSenhaSpecialCharacterValid || value == null) {
      return null;
    } else if (!isSenhaLengthValid) {
      return 'Senha deve conter no mínimo 6 caractéres';
    } else if (!isSenhaSpecialCharacterValid) {
      return 'Senha deve conter pelo menos 1 caractére especial';
    } else if (!senhaMaiscula && !senhaMinusculo) {
      return 'Senha deve conter pelo menos um caractére maiusculo e um minusculo';
    }
    return 'Senha inválida';
  }

  String? validConfirmPassWord(String? value) {
    if (value == senha) {
      return null;
    }

    return 'As senhas não são iguais';
  }

  bool validateCheckBox() {
    checkBoxError = !isActiveCheckBox;
    return isActiveCheckBox;
  }

  //================= SETS ======================
  void setSenha(String value) {
    senha = value;
    notifyListeners();
  }

  void setConfirmarSenha(String value) {
    confirmarSenha = value;
    notifyListeners();
  }

  void changeActiveCheckBox(bool value) {
    isActiveCheckBox = !isActiveCheckBox;
    if (isActiveCheckBox) {
      checkBoxError = false;
    }
    notifyListeners();
  }

  Future<void> loadingButton() async {
    //Simula o delay de uma chamada de API
    await Future.delayed(Duration(seconds: 2));
  }
}
