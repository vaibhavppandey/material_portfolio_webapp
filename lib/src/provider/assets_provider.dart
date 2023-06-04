import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:convert' as convert;

import 'package:material_portfolio_webapp/src/repository/assets_repository.dart'
    show AssetsRepository;

const _configAssetPath = "assets/json/assets.json";

final FutureProvider<AssetsRepository> assetsProvider =
    FutureProvider((ref) async {
  final config = await rootBundle.loadString(_configAssetPath);
  return AssetsRepository(config: convert.jsonDecode(config));
});
