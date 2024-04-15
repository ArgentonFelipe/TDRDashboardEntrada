import 'package:flutter/material.dart';

import '../styles/colors_app/colors_app.dart';
import '../styles/component_styles/component_styles.dart';
import '../styles/text_styles/text_styles.dart';

class ThemeApp {
  ThemeApp._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorsApp.i.primary,
    ),
  );

  static final theme = ThemeData(
    primaryColor: ColorsApp.i.primary,
    disabledColor: ColorsApp.i.primary.withOpacity(0.8),
    scaffoldBackgroundColor: ColorsApp.i.primary,
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(backgroundColor: ColorsApp.i.primary),
    primarySwatch: const MaterialColor(
      0xff003971,
      <int, Color>{
        50: Color(0xff003366),
        100: Color(0xff002e5a),
        200: Color(0xff00284f),
        300: Color(0xff002244),
        400: Color(0xff001d39),
        500: Color(0xff00172d),
        600: Color(0xff001122),
        700: Color(0xff000b17),
        800: Color(0xff00060b),
        900: Color(0xff000000),
      },
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(ColorsApp.i.primary),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorsApp.i.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.i.body.copyWith(color: ColorsApp.i.primary),
      labelStyle: TextStyles.i.body.copyWith(color: ColorsApp.i.primary),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.i.primary,
      extendedTextStyle: TextStyles.i.button,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
        ColorsApp.i.primary,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsApp.i.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ComponentStyles.i.elevatedButtonStyle,
    ),
    
  );
}
