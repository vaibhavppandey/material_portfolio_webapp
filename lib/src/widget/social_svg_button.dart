import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:material_portfolio_webapp/src/entity/social.dart';

class SocialSvgEmulatedButton extends StatefulWidget {
  const SocialSvgEmulatedButton({super.key, required this.social});

  final Social social;

  @override
  State<SocialSvgEmulatedButton> createState() =>
      _SocialSvgEmulatedButtonState();
}

class _SocialSvgEmulatedButtonState extends State<SocialSvgEmulatedButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    final CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutSine);
    _colorAnimation = ColorTween(
            begin: Theme.of(context).colorScheme.onBackground,
            end: widget.social.color)
        .animate(curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _animationController.forward(),
      onExit: (_) => _animationController.reverse(),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(widget.social.link),
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) => SvgPicture.asset(
                  "svg/${widget.social.asset}",
                  height: 36,
                  fit: BoxFit.fitHeight,
                  colorFilter:
                      ColorFilter.mode(_colorAnimation.value, BlendMode.srcIn),
                )),
      ),
    );
  }
}
