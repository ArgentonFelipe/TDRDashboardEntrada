import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DefaultLoading extends StatelessWidget {
  final Color? color;
  const DefaultLoading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoadingAnimationWidget.threeArchedCircle(
          color: this.color ?? Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
