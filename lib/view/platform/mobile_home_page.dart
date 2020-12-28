import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/sparkar/user_effects_detail.dart';

class MobileHomePage extends StatelessWidget {
  final List<NavigationRailDestination> destinations;
  final Widget appBar;
  final SparkARState state;

  PersistentBottomSheetController _bottomSheetController;

  MobileHomePage(this.state, this.appBar, this.destinations) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: appBar,
      body: Expanded(
          child: UserEffectDetail(state.userList[state.selectedIndex])),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        child: Container(
          color: Colors.transparent,
          height: kToolbarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  return InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    onTap: () {
                      showBottomDrawer(context);
                    },
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 18),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),

      /*floatingActionButton: _bottomDrawerVisible
                ? null
                : const Padding(
              padding: EdgeInsetsDirectional.only(bottom: 8),
              child: _ReplyFab(),
            ),*/

      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showBottomDrawer(BuildContext context) {
    if (_bottomSheetController != null) {
      _bottomSheetController.close();
      _bottomSheetController = null;
      return;
    }

    _bottomSheetController = showBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (BuildContext context) {
          return ConstrainedBox(
              constraints: BoxConstraints.loose(Size(double.infinity, 600)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    for (var i = 0; i < state.userList.length; i++)
                      InkWell(
                        onTap: () {
                          context
                              .read<SparkARBloc>()
                              .add(SparkARSelectUserAction(i));
                          _bottomSheetController.close();
                        },
                        child: ListTile(
                          leading: Image.network(state.userList[i].iconUrl),
                          title: Text(state.userList[i].name),
                        ),
                      ),
                  ],
                ),
              ));
        });
  }
}
