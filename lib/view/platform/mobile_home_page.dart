import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/sparkar/user_effects_detail.dart';

class MobileHomePage extends StatelessWidget {
  final List<NavigationRailDestination> destinations;
  final Widget appBar;
  final SparkARState state;

  MobileHomePage(this.state, this.appBar, this.destinations) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: appBar,
      body: UserEffectDetail(state.userList[state.selectedIndex]),
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
                    onPressed: () => showBottomDrawer(context),
                  )),
              Center(
                  child: Text(
                state.userList[state.selectedIndex].name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void showBottomDrawer(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: getModalBottomSheetBody);
  }

  Widget getModalBottomSheetBody(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: SizedBox(
            height: 700,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(70, 70, 70, .9),
                    child: SizedBox(
                      width: 128,
                      height: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                      constraints: BoxConstraints.loose(Size(
                          double.infinity,
                          orientation == Orientation.portrait
                              ? screenHeight / 2.5
                              : screenHeight / 3.5)),
                      child: getUsersListOrGrid(screenWidth, orientation)),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton.icon(
                      icon: Icon(Icons.arrow_drop_down),
                      label: Text("Chiudi"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                ])));
  }

  Widget getUsersListOrGrid(double width, Orientation orientation) {
    if (orientation == Orientation.portrait)
      return ListView.builder(
        itemCount: state.userList.length,
        itemBuilder: (context, i) => UserListItem(state: state, i: i),
      );
    else
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: width / 100),
        itemCount: state.userList.length,
        itemBuilder: (context, i) =>
            Center(child: UserListItem(state: state, i: i)),
      );
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem({
    Key key,
    @required this.state,
    @required this.i,
  }) : super(key: key);

  final SparkARState state;
  final int i;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(state.userList[i].iconUrl),
        title: Text(
          state.userList[i].name,
          style: state.selectedIndex == i
              ? TextStyle(color: Color.fromRGBO(20, 92, 255, 1))
              : null,
        ),
        selected: state.selectedIndex == i,
        selectedTileColor:
            Theme.of(context).navigationRailTheme.backgroundColor,
        onTap: () {
          context.read<SparkARBloc>().add(SparkARSelectUserAction(i));
          Navigator.pop(context);
        });
  }
}
