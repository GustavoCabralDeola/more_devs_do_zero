import 'package:flutter/cupertino.dart';
import 'package:more_devs_do_zero/features/login/pages/cadastro_page.dart';
import 'package:more_devs_do_zero/features/login/pages/login_page.dart';
import 'package:more_devs_do_zero/features/recover/pages/recover_pages.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    LoginPage.route: (context) => LoginPage(),
    CadastroPage.route: (context) => CadastroPage(),
    RecoverPage.route: (context) => RecoverPage(),
  };
}
