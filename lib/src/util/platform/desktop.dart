import 'package:flutter/material.dart';
import 'package:material_portfolio_webapp/src/util/platform/abstract_platform.dart';

const double _width = 960;
const Axis _direction = Axis.horizontal;
const double _iconSize = 48;

class Desktop implements Platform {
  @override
  Axis get direction => _direction;
  @override
  double get iconSize => _iconSize;
  @override
  double get width => _width;
  @override
  double? get height => null;

  const Desktop();
  @override
  TextStyle? buildTextStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .displayLarge
      ?.copyWith(color: Theme.of(context).colorScheme.onBackground);
}
