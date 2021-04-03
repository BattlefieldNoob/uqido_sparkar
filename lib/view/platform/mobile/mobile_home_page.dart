import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/common/home_app_bar.dart';
import 'package:uqido_sparkar/view/sparkar/user_effects_detail.dart';

import 'mobile_bottom_sheet_body.dart';

class MobileHomePage extends StatelessWidget {
  final List<NavigationRailDestination> destinations;
  final SparkARState state;

  MobileHomePage(this.state, this.destinations) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final scaffoldBody = state.map(
        valid: (validState) {
          return validState.userList.length != 0
              ? UserEffectDetail(validState.userList[validState.selected])
              : SizedBox();
        },
        loading: (loadingState) => Container(),
        logout: (value) => Text("Error, please logout/login again"),
        error: (errorState) => Text("Error, please reload"));

    final bottomAppBarTitle = state.maybeMap(
        valid: (validState) {
          validState.selected < 0 || validState.userList.length == 0
              ? Text("")
              : Text(
                  validState.userList[validState.selected].name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                );
        },
        orElse: () => Text(""));

    return Scaffold(
      extendBody: true,
      appBar: HomeAppBar(),
      body: scaffoldBody,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        child: Container(
          height: kToolbarHeight,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.arrow_drop_up),
                    label: Text("Account"),
                    onPressed: () => showBottomDrawer(context, state),
                  )),
              Center(child: bottomAppBarTitle)
            ],
          ),
        ),
      ),
    );
  }

  void showBottomDrawer(final BuildContext context, final SparkARState state) {
    final userList = state.maybeMap(
        orElse: () => List<SparkARUser>.empty(),
        valid: (validState) => validState.userList);

    final selected = state.maybeMap(
        orElse: () => -1, valid: (validState) => validState.selected);

    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) => MobileBottomSheetBody(userList, selected));
  }
}
