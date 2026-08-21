import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/login/controllers/cadastro_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_password_required.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  static String route = '/cadastro';

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  CadastroController cadastroController = CadastroController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _handleContinueButton() async {
    if (!cadastroController.validateCheckBox()) {
      setState(() {
        return;
      });
    }

    if (formKey.currentState!.validate()) {
      setState(() {
        cadastroController.isLoading = true;
      });

      await cadastroController.loadingButton();

      setState(() {
        cadastroController.isLoading = false;
      });
    }
    //futuramente não será necessário o setState, pois a tela
    // sera reconstruida com o provider
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 7),
              Container(
                child: Text(
                  'Criar uma conta',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: Text(
                  'Insira seus dados para iniciar suas compras',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),

              //Spacer(flex: 2),
              SizedBox(height: 50),
              AppTextField(
                controller: cadastroController.emailController,
                validator: (value) {
                  return cadastroController.validEmail(value);
                },
                hintText: 'email@dominio.com',
              ),
              SizedBox(height: 20),
              AppTextField(
                controller: cadastroController.nomeController,
                hintText: 'Nome',
              ),
              SizedBox(height: 20),
              AppTextField(
                hintText: 'Senha',
                validator: (value) {
                  return cadastroController.validPassword(value);
                },
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    cadastroController.setSenha(value);
                  });
                },
              ),
              SizedBox(height: 20),
              AppTextField(
                hintText: 'Confirmar Senha',
                validator: (value) {
                  return cadastroController.validConfirmPassWord(value);
                },
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    cadastroController.setConfirmarSenha(value);
                  });
                },
              ),
              SizedBox(height: 8),
              AppPasswordRequired(
                atendido: cadastroController.senhaMinimo6,
                text: 'Contem Minimo 6 Caracteres',
              ),
              AppPasswordRequired(
                atendido: cadastroController.senhaMaiscula,
                text: 'Contem Minimo Uma Letra Maiuscula',
              ),
              AppPasswordRequired(
                atendido: cadastroController.senhaMinusculo,
                text: 'Contem Minimo Uma Letra Miniscula',
              ),
              AppPasswordRequired(
                atendido: cadastroController.isSenhaSpecialCharacterValid,
                text: 'Contém Caráctere Especial',
              ),
              SizedBox(height: 150),
              AppElevatedButton(
                isLoading: cadastroController.isLoading,
                labelStyle: AppTextStyle.buttonLabel,
                label: 'Continuar',
                onPressed: () async => {
                  _handleContinueButton(),
                  await cadastroController.loadingButton(), //ver issoaqui
                },
                type: ButtonType.filled,
              ),

              SizedBox(height: 30),
              Row(
                children: [
                  AppCheckBox(
                    isError: true,
                    value: cadastroController.isActiveCheckBox,
                    onChanged: (value) {
                      setState(() {
                        cadastroController.changeActiveCheckBox(value!);
                      });
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
        ),
      ),
    );
  }
}
