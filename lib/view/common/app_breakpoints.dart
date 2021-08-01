import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

TransitionBuilder getResponsiveBreakpointsBuilder() => (context, widget) =>
    ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, widget!),
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, scaleFactor: 0.8, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ]);
