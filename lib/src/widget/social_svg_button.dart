import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:material_portfolio_webapp/src/entity/social.dart';

class SocialSvgEmulatedButton extends StatefulWidget {
  const SocialSvgEmulatedButton(
      {super.key, required this.height, required this.social});

  final double height;
  final Social social;

  @override
  State<SocialSvgEmulatedButton> createState() =>
      _SocialSvgEmulatedButtonState();
}

class _SocialSvgEmulatedButtonState extends State<SocialSvgEmulatedButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    _curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutSine);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation colorAnimation = ColorTween(
            begin: Theme.of(context).colorScheme.onBackground,
            end: widget.social.color)
        .animate(_curvedAnimation);
    return Tooltip(
      message: widget.social.asset,
      margin: const EdgeInsets.only(top: 8.0),
      textStyle: GoogleFonts.robotoSlab(
          textStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background)),
      child: AnimatedSize(
        clipBehavior: Clip.none,
        duration: const Duration(milliseconds: 250),
        child: MouseRegion(
          onEnter: (_) => _animationController.forward(),
          onExit: (_) => _animationController.reverse(),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _handlePayload(),
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, _) => _buildSvgAsset(colorAnimation)),
          ),
        ),
      ),
    );
  }

  SvgPicture _buildSvgAsset(Animation colorAnimation) => SvgPicture.asset(
        "assets/svg/${widget.social.asset}.svg",
        height: widget.height,
        fit: BoxFit.fitHeight,
        colorFilter: ColorFilter.mode(colorAnimation.value, BlendMode.srcIn),
      );
  void _handlePayload() {
    final payload = widget.social.payload;
    switch (widget.social.type) {
      case "link":
        launchUrl(Uri.parse(payload));
        break;
      case "mail":
        launchUrlString(
            "mailto:$payload?subject=Hello%20G&body=Nigga%20wanna%20see%20me%20fall");
        break;
      default:
        Clipboard.setData(ClipboardData(text: payload));
        ScaffoldMessenger.of(context)
            .showSnackBar(_buildSnackbar("Discord copied to clipboard!"));
        break;
    }
  }

  SnackBar _buildSnackbar(String text) => SnackBar(
        content: Text(text),
        clipBehavior: Clip.antiAlias,
      );
}
