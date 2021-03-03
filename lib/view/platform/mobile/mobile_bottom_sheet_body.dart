import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

import 'mobile_user_list_item.dart';

part 'mobile_bottom_sheet_body.g.dart';

class MobileBottomSheetBody extends StatelessWidget {
  const MobileBottomSheetBody(this.userList, this.selected, {Key? key})
      : super(key: key);

  final List<SparkARUser> userList;
  final int selected;

  @override
  Widget build(BuildContext context) {
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
                      child: UsersListOrGrid(
                          userList, selected, screenWidth, orientation)),
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
}

@swidget
Widget usersListOrGrid(final List<SparkARUser> userList, final int selected,
    final double width, final Orientation orientation) {
  if (orientation == Orientation.portrait)
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, i) => MobileUserListItem(
        userList: userList,
        i: i,
        selected: selected,
      ),
    );
  else
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: width / 100),
      itemCount: userList.length,
      itemBuilder: (context, i) => Center(
          child: MobileUserListItem(
        userList: userList,
        i: i,
        selected: selected,
      )),
    );
}
