import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:material_portfolio_webapp/src/util/platform/desktop.dart';
import 'package:material_portfolio_webapp/src/util/platform/mobile.dart';
import 'package:material_portfolio_webapp/src/util/platform/tablet.dart';
import 'package:material_portfolio_webapp/src/util/platform/small.dart';
import 'package:material_portfolio_webapp/src/util/platform/platforms.dart'
    show Platforms;
import 'package:material_portfolio_webapp/src/util/platform/abstract_platform.dart'
    show Platform;

class PlatformModel with ChangeNotifier {
  final Platforms? currentPlatform;

  PlatformModel({required this.currentPlatform});

  Platform get platformModel => getCurrentPlatformModel();

  Platform getCurrentPlatformModel() {
    final Platform currentPlatformModel;
    switch (currentPlatform) {
      case (Platforms.desktop):
        currentPlatformModel = const Desktop();
        break;
      case (Platforms.tablet):
        currentPlatformModel = const Tablet();
        break;
      case (Platforms.mobile):
        currentPlatformModel = const Mobile();
        break;
      default:
        currentPlatformModel = const Small();
    }
    // setPlatformModel
    // _platformModel = currentPlatformModel;
    // notifyListeners();
    return currentPlatformModel;
  }
}
