import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';

part 'desktop_navigation_rail.g.dart';

class IsTabletCubit extends Cubit<bool> {
  IsTabletCubit(isTablet) : super(isTablet);

  void setTablet() => emit(true);
  void setDesktop() => emit(false);
}

class DesktopNavigationRail extends StatelessWidget {
  final List<NavigationRailDestination> destinations;
  final SparkARState state;
  final bool isTablet;

  DesktopNavigationRail(this.destinations, this.state, this.isTablet);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsTabletCubit, bool>(builder: (context, isTablet) {
      var empty = destinations.length == 0;

      if (empty) {}

      return NavigationRail(
          destinations: destinations,
          elevation: 4,
          minWidth: 92,
          extended: !isTablet,
          minExtendedWidth: 350,
          leading: !isTablet ? DesktopHeader() : null,
          labelType: NavigationRailLabelType.none,
          onDestinationSelected: (index) =>
              context.read<SparkARBloc>().add(SparkARSelectUserAction(index)),
          selectedIndex: state.selected);
    });
  }
}

@swidget
Widget desktopHeader(BuildContext context) {
  final isTabletCubit = context.read<IsTabletCubit>();
  return Padding(
      padding: EdgeInsets.all(4),
      child: SizedBox(
          height: 56,
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkResponse(
                borderRadius: BorderRadius.circular(10),
                child: TextButton.icon(
                  icon: Icon(!isTabletCubit.state
                      ? Icons.arrow_left
                      : Icons.arrow_right),
                  label: Text(isTabletCubit.state ? "Apri" : "Chiudi"),
                  onPressed: () => isTabletCubit.state
                      ? isTabletCubit.setDesktop()
                      : isTabletCubit.setTablet(),
                )),
          )));
}
