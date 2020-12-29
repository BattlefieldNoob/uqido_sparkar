import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/sparkar/user_effects_detail.dart';

class DesktopHomePage extends StatelessWidget {
  final SparkARState state;
  final List<NavigationRailDestination> destinations;
  final Widget appBar;
  final bool isTablet;

  const DesktopHomePage(
      this.state, this.appBar, this.destinations, this.isTablet)
      : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Row(children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                color: Theme.of(context).navigationRailTheme.backgroundColor,
                child: SingleChildScrollView(
                  clipBehavior: Clip.antiAlias,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                        child: state.userList.length != 0
                            ? _DesktopNavigationRail(
                                destinations, state, isTablet)
                            : Material(
                                color: Color.fromRGBO(48, 54, 60, .9),
                                elevation: 4,
                                child: SizedBox(
                                  width: isTablet ? 92 : 350,
                                ),
                              )),
                  ),
                ),
              );
            },
          ), //,
          state.userList.length != 0
              ? Expanded(
                  child: UserEffectDetail(state.userList[state.selectedIndex]))
              : SizedBox()
        ]));
  }
}

class _DesktopNavigationRail extends HookWidget {
  final List<NavigationRailDestination> destinations;
  final SparkARState state;
  final bool isTablet;

  _DesktopNavigationRail(this.destinations, this.state, this.isTablet);

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
        leading: isTablet ? getHeader(extended) : null,
        labelType: NavigationRailLabelType.none,
        onDestinationSelected: (index) =>
            context.read<SparkARBloc>().add(SparkARSelectUserAction(index)),
        selectedIndex: state.selectedIndex);
  }

  Widget getHeader(ValueNotifier<bool> extended) {
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
}
