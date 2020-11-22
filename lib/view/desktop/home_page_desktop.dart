import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

import 'user_effects_detail.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop();

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (ctx) {
      //print('UserEffectDetail HookBuilder');
      final state = useBloc<SparkARBloc, SparkARState>(
        onEmitted: (_, prev, curr) {
          return prev.selectedIndex != curr.selectedIndex;
        },
      ).state;
      print('Home Page Desktop Build!');

      return Row(children: [
        SizedBox(
            width: 460,
            child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    const BoxShadow(spreadRadius: 0.5, blurRadius: 5)
                  ],
                  color: const Color.fromRGBO(48, 56, 66, 1.0),
                ),
                child: ListView.builder(
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) =>
                      getUserNameItem(context, state.userList, index),
                ))),
        Expanded(child: getDetailPage(state))
      ]);
    });
  }

  Widget getDetailPage(SparkARState state) {
    if (state.selectedIndex < 0)
      return Center(
          child: (state.searchKey != null && state.searchKey.isEmpty)
              ? const Text("No account found! Try pull to refresh")
              : const Text("No result found"));
    else
      return UserEffectDetail(state.userList[state.selectedIndex]);
  }

  Widget getUserNameItem(
      BuildContext context, List<SparkARUser> users, int index) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            tileColor: const Color.fromRGBO(58, 66, 76, 1.0),
            onTap: () =>
                context.read<SparkARBloc>().add(SparkARSelectUserAction(index)),
            dense: false,
            leading: CircleAvatar(
                backgroundColor: const Color.fromRGBO(78, 86, 136, 1.0),
                radius: 16,
                backgroundImage: NetworkImage(users[index].iconUrl)),
            title: Text(
              users[index].name,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 22),
            )));
  }
}
