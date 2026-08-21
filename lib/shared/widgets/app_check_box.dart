import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    this.isError = false,
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final void Function(bool?)? onChanged;
  // final String? Function(String?)? validator;
  final isError;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      side: isError ? BorderSide(color: AppColors.red, width: 2) : null,
    );
  }
}
