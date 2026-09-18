import 'package:flutter/material.dart';

class AppDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
  }) {
    return showDialog<T>(
      context: context,
      builder: (_) {
        return Dialog(
          child: SizedBox(
            width: 350,
            child: Padding(padding: const EdgeInsets.all(20), child: child),
          ),
        );
      },
    );
  }
}
