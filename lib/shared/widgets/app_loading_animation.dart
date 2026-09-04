import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppLoadingAnimation extends StatelessWidget {
  final int itemCount;
  final double height;
  final bool enabled;

  final Widget Function(BuildContext context, int index) itemBuilder;

  const AppLoadingAnimation({
    super.key,
    required this.itemCount,
    required this.height,
    required this.itemBuilder,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Skeletonizer(
        enabled: enabled,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
