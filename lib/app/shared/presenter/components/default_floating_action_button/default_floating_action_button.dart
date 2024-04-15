import 'package:flutter/material.dart';

import '../../../utils/styles/colors_app/colors_app.dart';
import '../../../utils/styles/text_styles/text_styles.dart';

class DefaultFloatingActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? backgroundColor;
  final bool isVisible;
  final String? heroTag;
  const DefaultFloatingActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.backgroundColor,
    this.icon = Icons.add_circle,
    this.isVisible = true,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.isVisible,
      child: FloatingActionButton.extended(
        heroTag: this.heroTag,
        backgroundColor: this.backgroundColor ?? Colors.white,
        label: Text(
          label,
          style: context.textStyles.button.copyWith(
            color: this.color ?? context.colors.primary,
          ),
        ),
        extendedTextStyle: context.textStyles.button,
        icon: Icon(
          icon,
          color: this.color ?? context.colors.primary,
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
