import 'dart:convert' as convert;
import 'package:flutter/services.dart';

import 'package:material_portfolio_webapp/src/entity/asset.dart' show Asset;
import 'package:material_portfolio_webapp/src/entity/social.dart' show Social;

const String _assetJsonPath = "assets/json/asset.json";
const String _socialJsonPath = "assets/json/social.json";

class PortoflioRepository {
  Future<Asset> get asset async =>
      Asset.fromJson(await _readJson(_assetJsonPath));
  Future<Social> get social async =>
      Social.fromJson(await _readJson(_socialJsonPath));
  // load json
  Future<Map<String, dynamic>> _readJson(
    String assetPath,
  ) async {
    final String response = await rootBundle.loadString(assetPath);
    return convert.jsonDecode(response);
  }
}
