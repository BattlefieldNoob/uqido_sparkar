import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/user_effects_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';

class HomePageDesktop extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      context.read<SparkARBloc>().add(SparkARUpdateAction());
    });
    return HookBuilder(builder: (ctx) {
      print('Home Page HookBuilder');
      final state = useBloc<SparkARBloc, SparkARState>(
        onEmitted: (_, prev, curr) {
          return prev.userList != curr.userList;
        },
      ).state;

      return RefreshIndicator(
          onRefresh: () async =>
              context.read<SparkARBloc>().add(SparkARUpdateAction()),
          child: Row(children: [
            SizedBox(
                width: 400,
                child: Container(
                    color: Color.fromRGBO(48, 56, 66, 1.0),
                    child: ListView.builder(
                      itemCount: state.userList.length,
                      itemBuilder: (context, index) =>
                          getUserNameItem(context, state.userList, index),
                    ))),
            Expanded(child: HookBuilder(builder: (ctx) {
              print('Detail HookBuilder');
              final state = useBloc<SparkARBloc, SparkARState>(
                onEmitted: (_, prev, curr) {
                  return prev.selectedIndex != curr.selectedIndex;
                },
              ).state;
              if (state.selectedIndex < 0)
                return Text("No Account Selected!");
              else {
                return UserEffectDetail(
                  effects: state.userList[state.selectedIndex].effects,
                );
              }
            }))
          ]));
    });
  }

  Widget getUserNameItem(
      BuildContext context, List<SparkARUser> users, int index) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: InkWell(
            onTap: () =>
                context.read<SparkARBloc>().add(SparkARSelectUserAction(index)),
            child: Container(
                color: Color.fromRGBO(58, 66, 76, 1.0),
                child: SizedBox(
                    height: 64,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              users[index].name,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20),
                            )))))));
  }
}
