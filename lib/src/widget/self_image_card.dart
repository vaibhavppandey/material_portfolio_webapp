import 'package:flutter/material.dart';

class SelfImageCard extends StatelessWidget {
  const SelfImageCard({super.key});

  static const String _imageAssetPath = "assets/image/self.jpg";

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 480,
      child: DecoratedBox(
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
    );
  }
}
