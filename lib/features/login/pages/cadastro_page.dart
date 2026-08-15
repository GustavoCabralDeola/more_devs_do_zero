import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/login/controllers/cadastro_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  static String route = '/cadastro';

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  CadastroController cadastroController = CadastroController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: EdgeInsets.all(8),
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
              hintText: 'email@dominio.com',
              errorText: cadastroController.emailError,
              onChanged: (value) {
                setState(() {
                  cadastroController.setEmail(value);
                });
              },
            ),
            SizedBox(height: 20),
            AppTextField(
              hintText: 'Nome',
              onChanged: (value) {
                setState(() {
                  cadastroController.setNome(value);
                });
              },
            ),
            SizedBox(height: 20),
            AppTextField(
              hintText: 'Senha',
              errorText: cadastroController.senhaError,
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
              errorText: cadastroController.confirmarSenhaError,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  cadastroController.setConfirmarSenha(value);
                });
              },
            ),
            SizedBox(height: 220),
            AppElevatedButton(
              labelStyle: AppTextStyle.buttonLabel,
              label: 'Continuar',
              onPressed: cadastroController.isActiveButton
                  ? () => {
                      print('print cliquei em continuar'),
                      //Navigator.pushNamed(context, CadastroPage.route),
                    }
                  : null,
              type: ButtonType.filled,
            ),
            SizedBox(height: 30),

            Row(
              children: [
                AppCheckBox(
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
    );
  }
}
