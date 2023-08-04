import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:material_portfolio_webapp/src/widget/self_image_card.dart'
    show SelfImageCard;
import 'package:material_portfolio_webapp/src/widget/social_svg_button.dart'
    show SocialSvgEmulatedButton;
import 'package:material_portfolio_webapp/src/widget/typewriter_text.dart'
    show TypewriterText;

import 'package:material_portfolio_webapp/src/repository/assets_repository.dart'
    show AssetsRepository;

import 'package:material_portfolio_webapp/src/provider/platforms_provider.dart'
    show platformsModelProvider, platformsProvider;
import 'package:material_portfolio_webapp/src/provider/assets_provider.dart'
    show assetsProvider;

class PortfolioBody extends ConsumerStatefulWidget {
  const PortfolioBody({super.key});

  @override
  ConsumerState<PortfolioBody> createState() => _PortfolioBodyState();
}

class _PortfolioBodyState extends ConsumerState<PortfolioBody> {
  @override
  Widget build(BuildContext context) {
    final currentPlatformModel = ref.watch(platformsModelProvider);
    final platformNotifier = ref.watch(platformsProvider.notifier);
    AsyncValue<AssetsRepository> assetRepo = ref.watch(assetsProvider);
    return Center(
      child: assetRepo.when(
        error: (error, _) => Text(error.toString(),
            style: GoogleFonts.robotoSlab(
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.error))),
        loading: () => SizedBox.square(
            dimension: 64,
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onBackground,
            )),
        data: (repo) => SizedBox(
          width: currentPlatformModel.width,
          height: currentPlatformModel.height,
          child: Flex(
            direction: currentPlatformModel.direction,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // if (platformNotifier.isMobile()) const Spacer(flex: 1),
              Flexible(
                  fit: FlexFit.loose,
                  flex: platformNotifier.isDesktop() ? 7 : 9,
                  child: SelfImageCard(
                      dimension: platformNotifier.isDesktop()
                          ? 480
                          : platformNotifier.isTablet()
                              ? 360
                              : 240)),
              Spacer(flex: platformNotifier.isDesktop() ? 1 : 2),
              Flexible(
                fit: FlexFit.tight,
                flex: platformNotifier.isDesktop() ? 12 : 9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TypewriterText(
                        texts: repo.asset.text,
                        textStyle:
                            currentPlatformModel.buildTextStyle(context)),
                    SizedBox(
                        height: platformNotifier.isDesktop() ? 36.0 : 48.0),
                    Wrap(
                      spacing: platformNotifier.isDesktop() ? 36.0 : 18.0,
                      runSpacing: platformNotifier.isDesktop() ? 18.0 : 12.0,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: repo.socials
                          .map((social) => SocialSvgEmulatedButton(
                                social: social,
                                height: currentPlatformModel.iconSize,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
