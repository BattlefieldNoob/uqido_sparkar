import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

import 'user_effects_detail.dart';

class HomePageDesktop extends StatelessWidget {
  final SparkARState state;

  HomePageDesktop(this.state);

  @override
  Widget build(BuildContext context) {
    print('Home Page HookBuilder');
    return Row(children: [
      SizedBox(
          width: 460,
          child: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius: 5)],
                color: Color.fromRGBO(48, 56, 66, 1.0),
              ),
              child: ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) =>
                    getUserNameItem(context, state.userList, index),
              ))),
      Expanded(child: UserEffectDetail())
    ]);
  }

  Widget getUserNameItem(
      BuildContext context, List<SparkARUser> users, int index) {
    return Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            tileColor: Color.fromRGBO(58, 66, 76, 1.0),
            onTap: () =>
                context.read<SparkARBloc>().add(SparkARSelectUserAction(index)),
            dense: false,
            leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(78, 86, 136, 1.0),
                radius: 16,
                backgroundImage: NetworkImage(users[index].iconUrl)),
            title: Text(
              users[index].name,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 22),
            )));
  }
}
