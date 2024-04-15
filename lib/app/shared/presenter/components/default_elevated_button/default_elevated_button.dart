import 'package:flutter/material.dart';

import '../../../utils/styles/colors_app/colors_app.dart';
import '../../../utils/styles/text_styles/text_styles.dart';
import '../default_loading/default_loading.dart';

class DefaultElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? height;
  final double? width;
  final double? elevation;

  const DefaultElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.width,
    this.icon,
    this.height,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.icon == null,
      replacement: SizedBox(
        child: ElevatedButton.icon(
          onPressed: this.isLoading ? null : this.onPressed,
          icon: this.isLoading
              ? const SizedBox.shrink()
              : Icon(
                  this.icon,
                  color: this.textColor ?? Colors.white,
                ),
          style: ElevatedButton.styleFrom(
            backgroundColor: this.backgroundColor ?? context.colors.primary,
            elevation: this.elevation ?? 0,
            minimumSize: Size.fromHeight(this.height ?? 48),
            disabledBackgroundColor:
                this.backgroundColor ?? context.colors.primary,
          ),
          label: Visibility(
            visible: this.isLoading,
            replacement: Text(
              this.label,
              style: context.textStyles.button.copyWith(
                color: this.textColor ?? Colors.white,
              ),
            ),
            child: DefaultLoading(color: this.textColor),
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: this.isLoading ? null : this.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: this.backgroundColor ?? context.colors.primary,
          elevation: this.elevation ?? 0,
          minimumSize: Size.fromHeight(this.height ?? 48),
          disabledBackgroundColor:
              this.backgroundColor ?? context.colors.primary,
        ),
        child: Visibility(
          visible: this.isLoading,
          replacement: Text(
            this.label,
            style: context.textStyles.button.copyWith(
              color: this.textColor ?? Colors.white,
            ),
          ),
          child: DefaultLoading(color: this.textColor),
        ),
      ),
    );
  }
}
