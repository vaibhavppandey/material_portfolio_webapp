import 'package:flutter/material.dart';

abstract class Platform {
  final Axis direction;
  final double iconSize;
  final double? width;
  final double? height;

  const Platform({
    required this.direction,
    required this.iconSize,
    this.width,
    this.height,
  });

  TextStyle? buildTextStyle(BuildContext context);
}
