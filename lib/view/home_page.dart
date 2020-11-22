import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';

class HomePageProvider extends StatelessWidget {
  final Future<Widget> desktopScreen;
  final Future<Widget> mobileScreen;

  const HomePageProvider(
      {Key key, @required this.desktopScreen, this.mobileScreen})
      : super(key: key);

  Future<Widget> getHomePage(ResponsiveBreakpoint active) {
    if (active.name == DESKTOP) {
      return desktopScreen;
    } else {
      return mobileScreen ?? desktopScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async =>
            context.read<SparkARBloc>().add(const SparkARUpdateAction()),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final active = ResponsiveWrapper.of(context).activeBreakpoint;
            return FutureBuilder(
              future: getHomePage(active),
              initialData: SizedBox(),
              builder: (context, snapshot) => snapshot.data,
            );
          },
        ));
  }
}
