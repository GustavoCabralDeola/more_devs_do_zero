import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/login/controllers/cadastro_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_password_required.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  static String route = '/cadastro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<CadastroController>(
          builder: (context, controller, child) {
            return Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 7),
                  Container(
                    child: Text(
                      'Criar uma conta',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Insira seus dados para iniciar suas compras',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  //Spacer(flex: 2),
                  SizedBox(height: 50),
                  AppTextField(
                    controller: controller.emailController,
                    validator: (value) {
                      return controller.validEmail(value);
                    },
                    hintText: 'email@dominio.com',
                  ),
                  SizedBox(height: 20),
                  AppTextField(
                    controller: controller.nomeController,
                    hintText: 'Nome',
                  ),
                  SizedBox(height: 20),
                  AppTextField(
                    hintText: 'Senha',
                    validator: (value) {
                      return controller.validPassword(value);
                    },
                    obscureText: true,
                    onChanged: (value) {
                      controller.setSenha(value);
                    },
                  ),
                  SizedBox(height: 20),
                  AppTextField(
                    hintText: 'Confirmar Senha',
                    validator: (value) {
                      return controller.validConfirmPassWord(value);
                    },
                    obscureText: true,
                    onChanged: (value) {
                      controller.setConfirmarSenha(value);
                    },
                  ),
                  SizedBox(height: 8),
                  AppPasswordRequired(
                    atendido: controller.senhaMinimo6,
                    text: 'Contem Minimo 6 Caracteres',
                  ),
                  AppPasswordRequired(
                    atendido: controller.senhaMaiscula,
                    text: 'Contem Minimo Uma Letra Maiuscula',
                  ),
                  AppPasswordRequired(
                    atendido: controller.senhaMinusculo,
                    text: 'Contem Minimo Uma Letra Miniscula',
                  ),
                  AppPasswordRequired(
                    atendido: controller.isSenhaSpecialCharacterValid,
                    text: 'Contém Caráctere Especial',
                  ),
                  SizedBox(height: 150),
                  AppElevatedButton(
                    isLoading: controller.isLoading,
                    labelStyle: AppTextStyle.buttonLabel,
                    label: 'Continuar',
                    onPressed: () async => {
                      controller.handleContinueButton(),
                      await controller.loadingButton(), //ver issoaqui
                    },
                    type: ButtonType.filled,
                  ),

                  SizedBox(height: 30),
                  Row(
                    children: [
                      AppCheckBox(
                        isError: true,
                        value: controller.isActiveCheckBox,
                        onChanged: (value) {
                          controller.changeActiveCheckBox(value!);
                        },
                      ),

                      GestureDetector(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Ao clicar em continuar, você concorda com os nossos \n',
                                style: TextStyle(color: Colors.grey),
                              ),

                              TextSpan(
                                text: 'Termos de Serviço',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: ' e com a ',
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
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
