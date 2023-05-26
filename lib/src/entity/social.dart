import 'dart:core';
import 'package:flutter/material.dart' show Color;

class Social {
  final String asset;
  final Color color;
  final Uri link;

  const Social({required this.asset, required this.color, required this.link});

  factory Social.fromJson(Map<String, dynamic> json) {
    Color colorFromHexString(String hexColor) {
      return Color(int.parse("FF${hexColor..replaceAll('#', '')}", radix: 16));
    }

    return Social(
        asset: json["asset"],
        color: colorFromHexString(json["color"]),
        link: Uri.parse(json["link"]));
  }
}
