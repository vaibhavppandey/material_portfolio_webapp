import 'package:material_portfolio_webapp/src/entity/asset.dart' show Asset;
import 'package:material_portfolio_webapp/src/entity/social.dart' show Social;

class AssetsRepository {
  Map<String, dynamic> config;
  Asset? _asset;
  List<Social>? _socials;

  Asset get asset => _asset!;
  List<Social> get socials => _socials!;

  AssetsRepository({required this.config}) {
    final Map<String, dynamic> decodedJson = config;
    _asset = Asset.fromJson(decodedJson["asset"]);
    _socials = ((decodedJson["social"] as List<dynamic>)
        .map((dynamic json) => Social.fromJson(json))).toList();
  }
}
