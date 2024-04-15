import 'dart:io';

import 'platform_wrapper_interface.dart';

class PlatformWrapper implements IPlatformWrapper {
  @override
  bool isAndroid() {
    return Platform.isAndroid;
  }

  @override
  bool isIOS() {
    return Platform.isIOS;
  }
}
