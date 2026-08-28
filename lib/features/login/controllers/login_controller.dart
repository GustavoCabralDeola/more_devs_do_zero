import 'dart:math';

import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/models/user.dart';
import 'package:more_devs_do_zero/shared/exceptions/auth_exception.dart';

class LoginController extends ChangeNotifier {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _regexSenha = RegExp(
    r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).+$',
  );
  // String email = '';
  // String senha = '';

  User? user;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isActiveButton = false;
  bool isLoading = false;
  bool lembrarMe = false;
  bool isActiveCheckBox = false;

  bool get isEmailValid => _emailRegex.hasMatch(emailController.text.trim());
  bool get isSenhaSpecialCharacterValid =>
      _regexSenha.hasMatch(senhaController.text.trim());
  bool get isSenhaLengthValid => senhaController.text.trim().length >= 6;

  changeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> handleLogin() async {
    //futuramente não será necessário o setState, pois a tela
    // sera reconstruida com o provider
    if (!formKey.currentState!.validate()) {
      throw ErrorDescription('validacao_incorreta');
    }

    changeIsLoading(true);
    try {
      await login();
      emailController.clear();
      senhaController.clear();
    } finally {
      changeIsLoading(false);
    }
    return;
  }

  //=============== VALIDATORS ===============
  void validFields() {
    isActiveButton =
        emailController.text.trim().isNotEmpty &&
        senhaController.text.trim().isNotEmpty;
  }

  String? validEmail(String? value) {
    if (_emailRegex.hasMatch(emailController.text)) {
      return null;
    }
    return 'E-mail inválido';
  }

  String? validPassword(String? value) {
    if (isSenhaLengthValid && isSenhaSpecialCharacterValid) {
      return null;
    } else if (!isSenhaLengthValid) {
      return 'Senha deve conter no mínimo 6 caractéres';
    } else if (!isSenhaSpecialCharacterValid) {
      return 'Senha deve conter pelo menos 1 caractére especial';
    }
    return 'Senha inválida';
  }

  //================= SETS ======================
  void setSenha(String value) {
    senhaController.text = value;
    validFields();
  }

  void setEmail(String value) {
    emailController.text = value;
    validFields();
  }

  // void changeActiveButton() {
  //   validFields();
  // }

  void changeActiveCheckBox(bool value) {
    isActiveCheckBox = !isActiveCheckBox;
    notifyListeners();
  }

  Future<void> login() async {
    //Simula o delay de uma chamada de API
    await Future.delayed(Duration(seconds: 2));
    if (emailController.text.trim() != 'gustavodeola@gmail.com' ||
        senhaController.text.trim() != '@Aero1224') {
      throw AuthException('E-mail ou senha inválidos');
    }
    user = User(nome: 'Gustavo', email: emailController.text);
  }
}
