import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:material_portfolio_webapp/src/_trash/hello_widget.dart';
import 'package:material_portfolio_webapp/src/layout/body.dart'
    show PortfolioBody;

import 'package:material_portfolio_webapp/src/theme/color.dart';
import 'package:material_portfolio_webapp/src/provider/platforms_provider.dart'
    show platformsProvider;

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaibhav P.',
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kMaterialSeedColor),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: kMaterialSeedColor, brightness: Brightness.dark),
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(body: Consumer(builder: (context, ref, _) {
        Future.microtask(() => ref
            .read(platformsProvider.notifier)
            .setCurrentPltaform(MediaQuery.of(context).size));
        return const PortfolioBody();
      })),
    );
  }
}
