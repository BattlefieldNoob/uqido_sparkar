import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/db/mock/mock_db.dart';
import 'package:uqido_sparkar/view/common/app_breakpoints.dart';
import 'package:uqido_sparkar/view/common/app_theme.dart';

import 'blocs/sparkar_bloc.dart';
import 'db/sparkar_db.dart';
import 'view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
      create: (_) => SparkARBloc(MockDB.getInstance()),
      child: MaterialApp(
          builder: getResponsiveBreakpointsBuilder(),
          theme: getTheme(),
          home: HomePage())));
}
