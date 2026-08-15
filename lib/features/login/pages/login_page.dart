import 'dart:math';

import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/features/login/pages/cadastro_page.dart';
import 'package:more_devs_do_zero/features/recover/pages/recover_pages.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();

  @override
  initState() {
    super.initState();
  }

  Future<void> login() async {
    setState(() {
      loginController.isLoading = true;
    });

    await loginController.login();

    setState(() {
      loginController.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),

                  Image.asset('assets/images/icone.png', height: 120),

                  Text(
                    "+DevsEcomm",
                    style: AppTextStyle.tittle,
                    textAlign: TextAlign.center,
                  ),

                  const Spacer(flex: 2),

                  AppTextField(
                    hintText: 'email@dominio.com',
                    errorText: loginController.emailError,
                    onChanged: (value) {
                      setState(() {
                        loginController.setEmail(value);
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  AppTextField(
                    hintText: '****************',
                    errorText: loginController.senhaError,
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        loginController.setSenha(value);
                      });
                    },
                  ),

                  Row(
                    children: [
                      AppCheckBox(
                        value: loginController.isActiveCheckBox,
                        onChanged: (value) {
                          setState(() {
                            loginController.changeActiveCheckBox(value!);
                          });
                        },
                      ),
                      Text(
                        'Lembrar-me',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RecoverPage.route);
                      },
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(color: AppColors.black),
                      ),
                    ),
                  ),

                  AppElevatedButton(
                    isLoading: loginController.isLoading,
                    labelStyle: AppTextStyle.buttonLabel,
                    label: 'Entrar',
                    onPressed: loginController.isActiveButton
                        ? () {
                            login();
                          }
                        : null,
                    type: ButtonType.filled,
                  ),

                  const SizedBox(height: 10),

                  AppElevatedButton(
                    labelStyle: const TextStyle(color: Colors.black),
                    label: 'Cadastrar-se',
                    onPressed: () {
                      Navigator.pushNamed(context, CadastroPage.route);
                    },
                    type: ButtonType.outlined,
                  ),

                  const Spacer(flex: 2),

                  GestureDetector(
                    onTap: () {
                      print('ARTUR PARKOUUUUUUUUUUR HAHA');
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Termos de Serviço',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' e ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: 'Politicas de Privacidade',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
