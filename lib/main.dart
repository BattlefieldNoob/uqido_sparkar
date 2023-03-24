import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/widgets/common/app_theme.dart';

import 'navigation/app_router.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRoute = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: getTheme(),
        routerConfig: _appRoute.config(),
      ),
      observers: [Logger()],
    );
  }
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
