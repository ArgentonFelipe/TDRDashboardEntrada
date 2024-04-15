import 'package:flutter/material.dart';

import '../colors_app/colors_app.dart';

class ComponentStyles {
  static ComponentStyles? _instance;

  ComponentStyles._();

  static ComponentStyles get i {
    _instance ??= ComponentStyles._();
    return _instance!;
  }

  ButtonStyle get elevatedButtonStyle {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(
        ColorsApp.i.primary,
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
