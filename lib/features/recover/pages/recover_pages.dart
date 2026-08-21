import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/recover/controllers/recover_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class RecoverPage extends StatefulWidget {
  const RecoverPage({super.key});

  static const String route = '/recover';

  @override
  State<RecoverPage> createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  RecoverController recoverController = RecoverController();

  Future<void> _handleContinueButton() async {
    //futuramente não será necessário o setState, pois a tela
    // sera reconstruida com o provider
    setState(() {
      recoverController.isLoading = true;
    });

    await recoverController.loadingButton();

    setState(() {
      recoverController.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text('Recuperar senha', style: AppTextStyle.tittle),
                  SizedBox(height: 20),
                  AppTextField(
                    hintText: 'email@dominio.com',
                    onChanged: (value) {
                      setState(() {
                        recoverController.setEmail(value);
                      });
                    },
                  ),
                  SizedBox(height: 300),
                  AppElevatedButton(
                    isLoading: recoverController.isLoading,
                    label: 'Continuar',
                    type: ButtonType.filled,
                    onPressed: recoverController.isActiveButton
                        ? () {
                            _handleContinueButton();
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
