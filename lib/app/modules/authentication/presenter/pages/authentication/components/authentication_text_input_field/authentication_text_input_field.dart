import 'package:flutter/material.dart';

import '../../../../../../../shared/utils/styles/text_styles/text_styles.dart';

class AuthenticationTextInputField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final bool isObscureText;
  final bool isEnabled;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  const AuthenticationTextInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.iconData,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.isObscureText = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextFormField(
            controller: controller,
            autofocus: false,
            enabled: isEnabled,
            cursorColor: Colors.black87,
            obscureText: isObscureText,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            style: context.textStyles.body,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              alignLabelWithHint: true,
              labelStyle: context.textStyles.body,
              hintStyle: context.textStyles.body,
            ),
          ),
        ),
      ),
    );
  }
}
