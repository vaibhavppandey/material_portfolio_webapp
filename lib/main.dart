import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

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
      home: Scaffold(
        body: Center(
            child: Text("A simple webapp",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))),
      ),
    );
  }
}
