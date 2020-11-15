import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';

import '../common/effect_list_item.dart';

class UserEffectDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (ctx) {
      //print('UserEffectDetail HookBuilder');
      final state = useBloc<SparkARBloc, SparkARState>(
        onEmitted: (_, prev, curr) {
          return prev.selectedIndex != curr.selectedIndex;
        },
      ).state;

      if (state.selectedIndex < 0)
        return Center(
            child: Text((state.searchKey != null && state.searchKey.isEmpty)
                ? "No account found! Try pull to refresh"
                : "No result found"));
      else {
        final effects = state.userList[state.selectedIndex].effects;

        return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            itemCount: effects.length,
            itemBuilder: (context, index) => EffectListItem(
                  effect: effects[index],
                ));
      }
    });
  }
}
