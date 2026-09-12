import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';

class AppTextStyle {
  static const TextStyle tittle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle price = TextStyle(
    color: AppColors.green,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonLabel = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
}
