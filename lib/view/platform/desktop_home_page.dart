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

  const DesktopHomePage(this.state, this.appBar, this.destinations)
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
                        child: _DesktopNavigationRail(destinations, state)),
                  ),
                ),
              );
            },
          ), //,
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: UserEffectDetail(state.userList[state.selectedIndex]))
        ]));
  }
}

class _DesktopNavigationRail extends HookWidget {
  final List<NavigationRailDestination> destinations;
  final SparkARState state;

  _DesktopNavigationRail(this.destinations, this.state);

  @override
  Widget build(BuildContext context) {
    var extended = useState(false);

    return NavigationRail(
        destinations: destinations,
        extended: extended.value,
        leading: getHeader(extended),
        labelType: NavigationRailLabelType.none,
        onDestinationSelected: (index) =>
            context.read<SparkARBloc>().add(SparkARSelectUserAction(index)),
        selectedIndex: state.selectedIndex);
  }

  Widget getHeader(ValueNotifier<bool> extended) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          const SizedBox(width: 6),
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(extended.value ? "Reduce" : "Expand")),
            onTap: () {
              extended.value = !extended.value;
            },
          )
        ],
      ),
    );
  }
}
