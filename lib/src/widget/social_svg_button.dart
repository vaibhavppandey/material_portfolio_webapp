import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:material_portfolio_webapp/src/entity/social.dart';
import 'package:material_portfolio_webapp/src/util/func/handle_payload.dart';
import 'package:material_portfolio_webapp/src/provider/platforms_provider.dart'
    show PlatformsProvider;

import 'package:material_portfolio_webapp/src/provider/platforms_provider.dart'
    show platformsProvider;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialSvgEmulatedButton extends ConsumerStatefulWidget {
  const SocialSvgEmulatedButton(
      {super.key, required this.height, required this.social});

  final double height;
  final Social social;

  @override
  ConsumerState<SocialSvgEmulatedButton> createState() =>
      _SocialSvgEmulatedButtonState();
}

class _SocialSvgEmulatedButtonState
    extends ConsumerState<SocialSvgEmulatedButton>
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

    final platformProvider = ref.watch(platformsProvider.notifier);
    final Widget finalWidget = buildWidget(colorAnimation, platformProvider);
    return AnimatedSize(
      clipBehavior: Clip.none,
      duration: const Duration(milliseconds: 250),
      child: platformProvider.isDesktop()
          ? finalWidget
          : Tooltip(
              message: widget.social.asset,
              margin: const EdgeInsets.only(top: 8.0),
              textStyle: GoogleFonts.robotoSlab(
                  textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background)),
              child: finalWidget,
            ),
    );
  }

  Widget buildWidget(
      Animation colorAnimation, PlatformsProvider platformsProvider) {
    return MouseRegion(
      onEnter: (_) => _animationController.forward(),
      onExit: (_) => _animationController.reverse(),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onLongPressDown: (_) => platformsProvider.isMobile()
            ? _animationController.forward()
            : () => null,
        onLongPressUp: () => platformsProvider.isMobile()
            ? _animationController.reverse()
            : () => null,
        onTap: () => handlePayload(widget.social.type, widget.social.payload,
            context, _buildSnackbar("ID copied :D")),
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) => _buildSvgAsset(colorAnimation)),
      ),
    );
  }

  SvgPicture _buildSvgAsset(Animation colorAnimation) => SvgPicture.asset(
        "assets/svg/${widget.social.asset}.svg",
        height: widget.height,
        fit: BoxFit.fitHeight,
        colorFilter: ColorFilter.mode(colorAnimation.value, BlendMode.srcIn),
      );

  SnackBar _buildSnackbar(String text) => SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.antiAlias,
        action: SnackBarAction(
          label: "Open",
          textColor: Theme.of(context).colorScheme.inversePrimary,
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse("discord://"))) {
              launchUrlString("discord://");
            } else {
              launchUrlString("https://discord.com/");
            }
          },
        ),
      );
}
