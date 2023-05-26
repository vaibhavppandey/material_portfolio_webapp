import 'package:flutter/material.dart';

import 'package:material_portfolio_webapp/src/layout/body.dart'
    show PortfolioBody;

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  static const Color _websiteM3SeedColor = Colors.blueGrey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaibhav P.',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: _websiteM3SeedColor),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: _websiteM3SeedColor, brightness: Brightness.dark),
      ),
      themeMode: ThemeMode.dark,
      home: const Scaffold(
        body: PortfolioBody(),
      ),
    );
  }
}
