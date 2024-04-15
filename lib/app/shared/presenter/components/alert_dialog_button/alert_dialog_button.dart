import 'package:flutter/material.dart';

import '../../../utils/styles/colors_app/colors_app.dart';
import '../../../utils/styles/text_styles/text_styles.dart';

class AlertDialogButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AlertDialogButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Text(
        this.label,
        style:
            context.textStyles.button.copyWith(color: context.colors.primary),
      ),
    );
  }
}
