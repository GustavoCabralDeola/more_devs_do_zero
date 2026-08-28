import 'dart:math';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/pages/home_page.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/features/login/pages/cadastro_page.dart';
import 'package:more_devs_do_zero/features/recover/pages/recover_pages.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/exceptions/auth_exception.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String route = '/login';

  // TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          ////Safearea desconta espaços do disposito ex: barra superior
          child: Consumer<LoginController>(
            builder: (context, controller, child) {
              return SizedBox(
                height:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: controller.formKey,
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
                          controller: controller.emailController,
                          validator: (value) {
                            return controller.validEmail(value);
                          },
                          hintText: 'email@dominio.com',
                        ),

                        const SizedBox(height: 10),

                        AppTextField(
                          controller: controller.senhaController,
                          validator: (value) {
                            return controller.validPassword(value);
                          },
                          hintText: '****************',
                          obscureText: true,
                        ),

                        Row(
                          children: [
                            AppCheckBox(
                              value: controller.isActiveCheckBox,
                              onChanged: (value) {
                                controller.changeActiveCheckBox(value!);
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
                          isLoading: controller.isLoading,
                          labelStyle: AppTextStyle.buttonLabel,
                          label: 'Entrar',
                          onPressed: () async {
                            try {
                              await controller.handleLogin();
                              Navigator.popAndPushNamed(
                                context,
                                HomePage.route,
                              );
                            } on AuthException catch (e) {
                              AnimatedSnackBar.material(
                                e.message,
                                type: AnimatedSnackBarType.error,
                                mobileSnackBarPosition:
                                    MobileSnackBarPosition.bottom,
                              ).show(context);
                            }
                          },
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
                          //RichText - Aninhar textos e modificar seu alinhamento
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
              );
            },
          ),
        ),
      ),
    );
  }
}
