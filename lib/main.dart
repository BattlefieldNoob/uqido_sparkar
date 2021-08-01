import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/view/common/app_breakpoints.dart';
import 'package:uqido_sparkar/view/common/app_theme.dart';
import 'package:uqido_sparkar/view/common/login_page.dart';

import 'blocs/sparkar_bloc.dart';
import 'blocs/sparkar_bloc.state.dart';
import 'db/sparkar_db.dart';
import 'view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
      create: (_) => SparkARBloc(SparkARDB.getInstance()),
      child: MaterialApp(
          builder: getResponsiveBreakpointsBuilder(),
          theme: getTheme(),
          home: BlocBuilder<SparkARBloc, SparkARState>(builder: (ctx, state) {
            return state.map(
                valid: (state) => HomePage(state.userList, state.selected),
                logout: (state) => LoginPage(),
                loading: (state) => Center(child: Text("Loading")),
                error: (state) => Center(child: Text("Error")));
          }))));
}
