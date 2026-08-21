import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';

class AppPasswordRequired extends StatelessWidget {
  const AppPasswordRequired({
    super.key,
    required this.atendido,
    required this.text,
  });
  final String text;
  final bool atendido;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          atendido ? Icons.check_circle : Icons.check_circle,
          color: atendido ? AppColors.green : AppColors.grey100,
          size: 22,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: atendido ? AppColors.green : AppColors.grey100,
          ),
        ),
      ],
    );
  }
}
