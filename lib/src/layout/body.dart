import 'package:flutter/material.dart';

import 'package:material_portfolio_webapp/src/widget/self_image_card.dart'
    show SelfImageCard;

class PortfolioBody extends StatefulWidget {
  const PortfolioBody({super.key});

  @override
  State<PortfolioBody> createState() => _PortfolioBodyState();
}

class _PortfolioBodyState extends State<PortfolioBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 960,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Flexible(flex: 3, child: SelfImageCard()),
          const Spacer(flex: 1),
          Flexible(
            flex: 6,
            child: Text(
              "Hello I'm Vaibhav",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}
