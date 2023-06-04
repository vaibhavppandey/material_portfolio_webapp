import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:material_portfolio_webapp/src/_trash/hello_widget.dart';
import 'package:material_portfolio_webapp/src/layout/body.dart'
    show PortfolioBody;
import 'package:material_portfolio_webapp/src/provider/assets_provider.dart';

import 'package:material_portfolio_webapp/src/theme/color.dart';
import 'package:material_portfolio_webapp/src/provider/platforms_provider.dart'
    show platformsProvider;

import 'package:material_portfolio_webapp/src/repository/assets_repository.dart'
    show AssetsRepository;

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

class JsonStuff extends ConsumerWidget {
  const JsonStuff({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AssetsRepository> assetsRepo = ref.watch(assetsProvider);
    return assetsRepo.when(
      loading: () => const LinearProgressIndicator(),
      error: (error, _) => Text(error.toString()),
      data: (repo) => Text(repo.config.toString()),
    );
  }
}
