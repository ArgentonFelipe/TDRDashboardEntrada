import 'package:flutter/material.dart';

extension GridColumnsExtension on BuildContext {
  double get columnSize1 {
    return 8.33 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize2 {
    return 16.66 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize3 {
    return 25 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize4 {
    return 33.33 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize5 {
    return 41.66 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize6 {
    return 50 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize7 {
    return 58.33 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize8 {
    return 66.66 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize9 {
    return 75 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize10 {
    return 83.33 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize11 {
    return 91.66 / 100 * MediaQuery.sizeOf(this).width;
  }

  double get columnSize12 {
    return 100 * MediaQuery.sizeOf(this).width;
  }
}
