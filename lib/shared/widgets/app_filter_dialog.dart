import 'package:flutter/material.dart';

class AppFilterDialog {
  static void show({required BuildContext context, required Widget child}) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(child: child);
      },
    );
  }
}
