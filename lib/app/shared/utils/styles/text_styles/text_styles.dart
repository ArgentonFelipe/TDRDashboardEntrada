import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get appFont => 'FiraSans';

  TextStyle get title {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  TextStyle get subtitle {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  TextStyle get button {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

  TextStyle get body {
    return TextStyle(
      fontFamily: appFont,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: Colors.black,
    );
  }
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
