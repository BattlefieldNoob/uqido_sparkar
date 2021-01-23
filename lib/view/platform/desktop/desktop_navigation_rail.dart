import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';

part 'desktop_navigation_rail.g.dart';

class DesktopNavigationRail extends HookWidget {
  final List<NavigationRailDestination> destinations;
  final SparkARState state;
  final bool isTablet;

  DesktopNavigationRail(this.destinations, this.state, this.isTablet);

  @override
  Widget build(BuildContext context) {
    var extended = useState(!isTablet);

    var empty = destinations.length == 0;

    if (empty) {}

    return NavigationRail(
        destinations: destinations,
        elevation: 4,
        minWidth: 92,
        extended: extended.value,
        minExtendedWidth: 350,
        leading: isTablet ? DesktopHeader(extended) : null,
        labelType: NavigationRailLabelType.none,
        onDestinationSelected: (index) =>
            context.read<SparkARBloc>().add(SparkARSelectUserAction(index)),
        selectedIndex: state.selectedIndex);
  }
}

@swidget
Widget desktopHeader(ValueNotifier<bool> extended) {
  return Padding(
      padding: EdgeInsets.all(4),
      child: SizedBox(
          height: 56,
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkResponse(
                borderRadius: BorderRadius.circular(10),
                child: TextButton.icon(
                  icon: Icon(
                      extended.value ? Icons.arrow_left : Icons.arrow_right),
                  label: Text(!extended.value ? "Apri" : "Chiudi"),
                  onPressed: () => extended.value = !extended.value,
                )),
          )));
}
