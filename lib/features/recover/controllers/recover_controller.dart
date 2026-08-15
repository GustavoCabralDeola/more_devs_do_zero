class RecoverController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  String email = '';
  bool isActiveButton = false;
  bool get isEmailValid => _emailRegex.hasMatch(email.trim());

  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) return null;

    return 'E-mail Inválido';
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActiveButton();
  }

  void changeActiveButton() {
    isActiveButton = isEmailValid;
  }
}
