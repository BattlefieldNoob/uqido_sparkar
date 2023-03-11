import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:uqido_sparkar/widgets/app.dart';
import 'package:uqido_sparkar/widgets/common/app_breakpoints.dart';
import 'package:uqido_sparkar/widgets/common/app_theme.dart';

import 'mock_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
          builder: (context, child) {
            child = OneContext().builder(context, child);
            child = getResponsiveBreakpointsBuilder()(context, child);
            return child;
          },
          theme: getTheme(),
          home: const App())));
}
