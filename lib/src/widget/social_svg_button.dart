import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:material_portfolio_webapp/src/entity/social.dart';
import 'package:material_portfolio_webapp/src/util/func/handle_payload.dart';

import 'package:material_portfolio_webapp/src/provider/platforms_provider.dart'
    show platformsProvider;

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
    final Widget finalWidget = buildWidget(colorAnimation);
    return platformProvider.isDesktop()
        ? finalWidget
        : Tooltip(
            message: widget.social.asset,
            margin: const EdgeInsets.only(top: 8.0),
            textStyle: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.background)),
            child: finalWidget,
          );
  }

  Widget buildWidget(Animation colorAnimation) {
    return AnimatedSize(
      clipBehavior: Clip.none,
      duration: const Duration(milliseconds: 250),
      child: MouseRegion(
        onEnter: (_) => _animationController.forward(),
        onExit: (_) => _animationController.reverse(),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () =>
              handlePayload(widget.social.payload, context, _buildSnackbar()),
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) => _buildSvgAsset(colorAnimation)),
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

  SnackBar _buildSnackbar() => const SnackBar(
        content: Text("Id has been copied to clipboard"),
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.antiAlias,
      );
}
