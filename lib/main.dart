import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logger/logger.dart' show Logger, Level;

// import 'package:provider/provider.dart';
// import 'package:material_portfolio_webapp/src/model/current_platform.dart'
//     show CurrentPlatform;
// import 'package:material_portfolio_webapp/src/model/platform_model.dart'
//     show PlatformModel;
import 'package:material_portfolio_webapp/src/app.dart' show PortfolioApp;

// final _logger = Logger(level: Level.nothing);

void main() {
  runApp(const ProviderScope(child: PortfolioApp()));

  // MultiProvider multiProvider = MultiProvider(providers: [
  //   ChangeNotifierProvider<CurrentPlatform>(create: (_) => CurrentPlatform()),
  //   ChangeNotifierProxyProvider<CurrentPlatform, PlatformModel>(
  //       create: (context) => PlatformModel(
  //           context: context,
  //           currentPlatform:
  //               Provider.of<CurrentPlatform>(context, listen: false)
  //                   .currentPlatform),
  //       update: (context, currentPlatform, _) {
  //         _logger.d("UPDATE: current platform updated");
  //         return PlatformModel(
  //             context: context,
  //             currentPlatform: currentPlatform.currentPlatform);
  //       })
  // ], child: const PortfolioApp());
}
