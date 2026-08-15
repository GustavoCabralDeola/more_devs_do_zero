import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';

enum ButtonType { filled, outlined }

class AppElevatedButton extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final VoidCallback? onPressed;
  final ButtonType type;

  const AppElevatedButton({
    super.key,
    required this.label,
    this.labelStyle,
    this.onPressed,
    required this.type,
  });

  ButtonStyle _getStyle() {
    switch (type) {
      case ButtonType.filled:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          textStyle: AppTextStyle.buttonLabel,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      case ButtonType.outlined:
        return ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(48),
          foregroundColor: AppColors.black,
          backgroundColor: AppColors.white,
          textStyle: AppTextStyle.buttonLabel,

          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(12),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(label, style: labelStyle),
      onPressed: onPressed,

      style: _getStyle(),
    );
  }
}
