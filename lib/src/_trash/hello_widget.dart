import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:material_portfolio_webapp/src/provider/platforms_provider.dart';

class HelloWidget extends ConsumerStatefulWidget {
  const HelloWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HelloWidgetState();
}

class _HelloWidgetState extends ConsumerState<HelloWidget> {
  @override
  Widget build(BuildContext context) {
    // Future.microtask(() => ref
    //     .read(platformsProvider.notifier)
    //     .setCurrentPltaform(MediaQuery.of(context).size));
    final currentPlatformModel = ref.watch(platformsModelProvider);
    return Center(
      child: Container(
        height: currentPlatformModel.height,
        width: currentPlatformModel.width,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ref.watch(platformsProvider).toString(),
              ),
              const SizedBox(height: 36),
              // Text(
              //     "Size: ${platformModel.platformModel.height}, ${platformModel.platformModel.width}"),
            ],
          ),
        ),
      ),
    );
  }
}
