import 'package:flutter/material.dart';

import '../../../utils/styles/colors_app/colors_app.dart';
import '../../../utils/styles/text_styles/text_styles.dart';

class AlertDialogInfo extends StatelessWidget {
  final String title;
  final String description;
  final Function()? onPressed;

  const AlertDialogInfo({
    super.key,
    required this.title,
    this.description = 'Ocorreu um erro',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      title: Center(
        child: Text(
          this.title,
          textAlign: TextAlign.center,
          style: context.textStyles.title,
        ),
      ),
      content: Text(
        this.description,
        textAlign: TextAlign.center,
        style: context.textStyles.body,
      ),
      actionsPadding: const EdgeInsets.all(8),
      actions: [
        TextButton(
          onPressed: this.onPressed ?? () => Navigator.of(context).pop(),
          child: Text(
            'Continuar',
            style: context.textStyles.button
                .copyWith(color: context.colors.primary),
          ),
        ),
      ],
    );
  }
}
