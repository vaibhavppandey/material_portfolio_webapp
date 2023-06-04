import 'package:flutter/material.dart' show ChangeNotifier, Size;
import 'package:material_portfolio_webapp/src/util/platform/platforms.dart'
    show Platforms;

class CurrentPlatform with ChangeNotifier {
  Platforms? _currentPlatform;
  Platforms? get currentPlatform => _currentPlatform;

  void buildPlatform(Size size) {
    final Platforms platform;
    if (size.width >= 1024) {
      platform = Platforms.desktop;
    } else if (size.width > 768) {
      platform = Platforms.tablet;
    } else if (size.width >= 480) {
      platform = Platforms.mobile;
    } else {
      platform = Platforms.small;
    }
    // setPlatform
    _currentPlatform = platform;
    notifyListeners();
  }
}
