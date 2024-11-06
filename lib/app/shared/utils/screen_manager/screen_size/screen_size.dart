import 'package:flutter/material.dart';

import '../patterns/screen_size_patterns.dart';

extension ScreenSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenShortestSide => MediaQuery.sizeOf(this).shortestSide;
  double get screenLongestSize => MediaQuery.sizeOf(this).longestSide;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;

  bool get isMobile {
    return screenWidth <= ScreenSizePatters.mobile;
  }

  bool get isMobileUP {
    return screenWidth >= ScreenSizePatters.mobile;
  }

  bool get isMobileDOWN {
    return screenWidth <= ScreenSizePatters.mobile;
  }

  bool get isTablet {
    return screenWidth > ScreenSizePatters.mobile &&
        MediaQuery.sizeOf(this).width <= ScreenSizePatters.tablet;
  }

  bool get isTabletUP {
    return screenWidth >= ScreenSizePatters.tablet;
  }

  bool get isTabletDOWN {
    return screenWidth <= ScreenSizePatters.tablet;
  }

  bool get isDesktopLg {
    return screenWidth > ScreenSizePatters.tablet &&
        MediaQuery.sizeOf(this).width <= ScreenSizePatters.desktopLg;
  }

  bool get isDesktopLgUP {
    return screenWidth >= ScreenSizePatters.desktopLg;
  }

  bool get isDesktopLgDOWN {
    return screenWidth <= ScreenSizePatters.desktopLg;
  }

  bool get isDesktopXl {
    return screenWidth > ScreenSizePatters.desktopLg &&
        MediaQuery.sizeOf(this).width <= ScreenSizePatters.desktopXl;
  }

  bool get isDesktopXlUP {
    return screenWidth >= ScreenSizePatters.desktopXl;
  }

  bool get isDesktopXlDOWN {
    return screenWidth <= ScreenSizePatters.desktopXl;
  }

  bool get isDesktopXXl {
    return screenWidth > ScreenSizePatters.desktopXl &&
        MediaQuery.sizeOf(this).width <= ScreenSizePatters.desktopXXl;
  }

  bool get isDesktopXXlUP {
    return screenWidth >= ScreenSizePatters.desktopXXl;
  }

  bool get isDesktopXXlDOWN {
    return screenWidth <= ScreenSizePatters.desktopXXl;
  }

  double get totalWidth {
    return screenWidth;
  }
}
