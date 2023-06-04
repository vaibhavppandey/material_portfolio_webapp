import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:material_portfolio_webapp/src/util/platform/desktop.dart';
import 'package:material_portfolio_webapp/src/util/platform/mobile.dart';
import 'package:material_portfolio_webapp/src/util/platform/tablet.dart';
import 'package:material_portfolio_webapp/src/util/platform/small.dart';
import 'package:material_portfolio_webapp/src/util/platform/platforms.dart'
    show Platforms;
import 'package:material_portfolio_webapp/src/util/platform/abstract_platform.dart'
    show Platform;

class PlatformsProvider extends StateNotifier<Platforms> {
  PlatformsProvider() : super(Platforms.desktop);

  void setCurrentPltaform(Size size) {
    if (size.width >= 1024) {
      state = Platforms.desktop;
    } else if (size.width >= 768) {
      state = Platforms.tablet;
    } else if (size.width >= 360) {
      state = Platforms.mobile;
    } else {
      state = Platforms.small;
    }
  }

  bool isDesktop() => state == Platforms.desktop;

  bool isTablet() => state == Platforms.tablet;

  bool isMobile() => state == Platforms.mobile;
}

final platformsProvider =
    StateNotifierProvider<PlatformsProvider, Platforms>((ref) {
  return PlatformsProvider();
});

final platformsModelProvider = StateProvider<Platform>((ref) {
  final Platform currentPlatformModel;
  switch (ref.watch(platformsProvider)) {
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
  return currentPlatformModel;
});
