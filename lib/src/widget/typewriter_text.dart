import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypewriterText extends StatelessWidget {
  final TextStyle? textStyle;
  const TypewriterText({super.key, required this.textStyle});

  static const _texts = [
    "Hello I'm Vaibhav",
    "I am into Flutter",
    "I <3 openSource"
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      pause: const Duration(milliseconds: 1200),
      repeatForever: true,
      animatedTexts:
          _texts.map((String text) => _buildAnimatedText(text)).toList(),
    );
  }

  TypewriterAnimatedText _buildAnimatedText(String text) =>
      TypewriterAnimatedText(text,
          cursor: '|',
          speed: const Duration(milliseconds: 90),
          textStyle: GoogleFonts.robotoSlab(textStyle: textStyle));
}
