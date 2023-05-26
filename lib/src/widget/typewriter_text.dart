import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypewriterText extends StatelessWidget {
  const TypewriterText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      pause: const Duration(milliseconds: 1200),
      repeatForever: true,
      animatedTexts: [
        "Hello I'm Vaibhav",
        "I am into Flutter",
        "I <3 openSource"
      ]
          .map((String text) => TypewriterAnimatedText(text,
              cursor: '|',
              speed: const Duration(milliseconds: 90),
              textStyle: GoogleFonts.robotoSlab(
                  textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground))))
          .toList(),
    );
  }
}