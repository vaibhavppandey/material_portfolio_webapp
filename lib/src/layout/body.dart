import 'package:flutter/material.dart';

import 'package:material_portfolio_webapp/src/repository/data.dart'
    show socials;

import 'package:material_portfolio_webapp/src/widget/self_image_card.dart'
    show SelfImageCard;

import 'package:material_portfolio_webapp/src/widget/social_svg_button.dart'
    show SocialSvgEmulatedButton;
import 'package:material_portfolio_webapp/src/widget/typewriter_text.dart'
    show TypewriterText;

class PortfolioBody extends StatefulWidget {
  const PortfolioBody({super.key});

  @override
  State<PortfolioBody> createState() => _PortfolioBodyState();
}

class _PortfolioBodyState extends State<PortfolioBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 960,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Flexible(flex: 7, child: SelfImageCard()),
            const Spacer(flex: 1),
            Flexible(
              fit: FlexFit.tight,
              flex: 12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const TypewriterText(),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: socials
                        .map((social) => Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: SocialSvgEmulatedButton(social: social),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
