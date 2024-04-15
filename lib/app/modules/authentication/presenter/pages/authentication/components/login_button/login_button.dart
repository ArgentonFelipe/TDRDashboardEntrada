import 'package:flutter/material.dart';

import '../../../../../../../shared/presenter/components/default_elevated_button/default_elevated_button.dart';
import '../../../../../../../shared/utils/styles/colors_app/colors_app.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;

  const LoginButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultElevatedButton(
      height: 52,
      onPressed: this.onPressed,
      label: this.label,
      isLoading: this.isLoading,
      backgroundColor: Colors.white,
      textColor: context.colors.primary,
      icon: Icons.login,
      elevation: 10,
    );
  }
}
