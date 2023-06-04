import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfImageCard extends ConsumerWidget {
  const SelfImageCard({super.key, required this.dimension});

  final double dimension;
  static const String _imageAssetPath = "assets/image/self.jpg";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedSize(
      clipBehavior: Clip.none,
      duration: const Duration(milliseconds: 250),
      child: SizedBox.square(
        dimension: dimension,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(_imageAssetPath),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
            ),
          ),
        ),
      ),
    );
  }
}
