import 'dart:core';
import 'package:flutter/material.dart' show Color;

class Social {
  final String asset;
  final Color color;
  final String payload;
  final String type;

  const Social({
    required this.asset,
    required this.color,
    required this.payload,
    required this.type,
  });

  factory Social.fromJson(Map<String, dynamic> json) {
    Color colorFromHexString(String hexColor) {
      return Color(int.parse("FF${hexColor.replaceAll('#', '')}", radix: 16));
    }

    return Social(
        asset: json["asset"] as String,
        color: colorFromHexString(json["color"]),
        payload: json["payload"] as String,
        type: json["type"] as String);
  }
}
