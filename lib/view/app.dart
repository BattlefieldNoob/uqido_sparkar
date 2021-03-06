import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/db/firestore_db.dart';
import 'package:uqido_sparkar/db/netlify_function_db.dart';
import 'package:uqido_sparkar/view/common/home_page.dart';

import 'common/app_theme.dart';

class App extends StatelessWidget {
  final ValueNotifier<bool> extended = new ValueNotifier(false);

  App();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SparkARBloc(
            [NetlifyFunctionDB.getInstance(), FirestoreDB.getInstance()]),
        child: MaterialApp(
            builder: (context, widget) => ResponsiveWrapper.builder(
                    BouncingScrollWrapper.builder(context, widget),
                    breakpoints: [
                      ResponsiveBreakpoint.resize(450, name: MOBILE),
                      ResponsiveBreakpoint.autoScale(800,
                          scaleFactor: 0.8, name: TABLET),
                      ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ]),
            theme: getTheme(),
            home: HomePage()));
  }
}
