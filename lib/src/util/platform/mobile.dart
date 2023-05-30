import 'package:flutter/material.dart';
import 'package:material_portfolio_webapp/src/util/platform/abstract_platform.dart';

const double _height = 480;
const double _iconSize = 32;
const Axis _direction = Axis.vertical;

class Mobile implements Platform {
  @override
  Axis get direction => _direction;
  @override
  double get iconSize => _iconSize;
  @override
  double? get width => null;
  @override
  double get height => _height;

  const Mobile();
  @override
  TextStyle? buildTextStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .displaySmall
      ?.copyWith(color: Theme.of(context).colorScheme.onBackground);
}
