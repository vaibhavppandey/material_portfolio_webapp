import 'package:flutter/material.dart';
import 'package:material_portfolio_webapp/src/util/platform/abstract_platform.dart';

const double _height = 720;
const Axis _direction = Axis.vertical;
const double _iconSize = 16;

class Small implements Platform {
  @override
  Axis get direction => _direction;
  @override
  double get iconSize => _iconSize;
  @override
  double? get width => null;
  @override
  double get height => _height;

  const Small();
  @override
  TextStyle? buildTextStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineLarge
      ?.copyWith(color: Theme.of(context).colorScheme.onBackground);
}
