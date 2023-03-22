import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:uqido_sparkar/widgets/common/app_theme.dart';

import 'navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _appRoute = AppRouter();

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: MaterialApp.router(
        builder: (context, child) {
          child = OneContext().builder(context, child);
          return child;
        },
        theme: getTheme(),
        routerConfig: _appRoute.config(),
      ),
    ),
  );
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('didUpdateProvider: $provider, newState: $newValue');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    print('didDisposeProvider: $provider');
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('didAddProvider: $provider');
  }
}
