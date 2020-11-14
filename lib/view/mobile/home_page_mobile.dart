import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';

import 'user_list_item.dart';

class HomePageMobile extends StatelessWidget {
  final SparkARState state;

  HomePageMobile(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: state.userList.length,
      itemBuilder: (context, index) =>
          UserListItem(user: state.userList[index]),
    ));
  }
}
