import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/view/common/effect_list_item.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile();

  @override
  Widget build(BuildContext context) {
    return HookBuilder(builder: (ctx) {
      //print('UserEffectDetail HookBuilder');
      final state = useBloc<SparkARBloc, SparkARState>(
        onEmitted: (_, prev, curr) {
          return prev.selectedIndex != curr.selectedIndex;
        },
      ).state;
      print("Build HomePageMobile!");
      final flattenList =
          state.userList.expand((e) => [e.name, ...e.effects]).toList();

      return Container(
          child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: flattenList.length,
        itemBuilder: (context, index) {
          final elem = flattenList[index];
          if (elem is SparkAREffect) {
            return EffectListItem(
              effect: elem,
            );
          }
          return getTitleItemList(elem);
        },
      ));
    });
  }

  Column getTitleItemList(Object elem) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 8,
      ),
      Text(
        elem.toString(),
        style: const TextStyle(fontSize: 45, color: Colors.white),
      ),
      const SizedBox(
        height: 8,
      )
    ]);
  }
}
