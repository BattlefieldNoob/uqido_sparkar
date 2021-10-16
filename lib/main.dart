import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:uqido_sparkar/db/firestore_db.dart';
import 'package:uqido_sparkar/db/netlify_function_db.dart';
import 'package:uqido_sparkar/view/common/app_breakpoints.dart';
import 'package:uqido_sparkar/view/common/app_theme.dart';

import 'blocs/sparkar_bloc.dart';
import 'db/sparkar_db.dart';
import 'mock_main.dart';
import 'view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
          builder: OneContext().builder,
          theme: getTheme(),
          home: const HomePage())));
}
