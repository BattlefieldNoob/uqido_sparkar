import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

TransitionBuilder getResponsiveBreakpointsBuilder() => (context, widget) =>
    ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, scaleFactor: 0.8, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ]);
