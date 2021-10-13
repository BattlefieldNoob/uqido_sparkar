import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:uqido_sparkar/db/mock/mock_db.dart';
import 'package:uqido_sparkar/view/common/app_breakpoints.dart';
import 'package:uqido_sparkar/view/common/app_theme.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_home_page.dart';

import 'blocs/sparkar_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
      create: (_) => SparkARBloc(MockDB.getInstance()),
      child: MaterialApp(
          builder: OneContext().builder,
          theme: getTheme(),
          home: const MobileHomePage())));
}
