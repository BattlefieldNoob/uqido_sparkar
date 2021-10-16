import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:uqido_sparkar/db/mock/mock_db.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:uqido_sparkar/view/common/app_breakpoints.dart';
import 'package:uqido_sparkar/view/common/app_theme.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_home_page.dart';

import 'blocs/sparkar_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
          builder: OneContext().builder,
          theme: getTheme(),
          home: const MobileHomePage())));
}

//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  runApp(ProviderScope(
//      observers: [Logger()],
//      child: MaterialApp(theme: getTheme(), home: const Example())));
//}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}
