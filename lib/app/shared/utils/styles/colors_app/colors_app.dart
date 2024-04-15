import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color.fromRGBO(34, 71, 115, 1);

  MaterialColor get primarySwatch {
    return const MaterialColor(
      0xff224773,
      <int, Color>{
        50: Color(0xff224773),
        100: Color(0xff1f4068),
        200: Color(0xff1b395c),
        300: Color(0xff183251),
        400: Color(0xff11243a),
        500: Color(0xff0e1c2e),
        600: Color(0xff0a1522),
        700: Color(0xff070e17),
        800: Color(0xff03070b),
        900: Color(0xff000000),
      },
    );
  }
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
