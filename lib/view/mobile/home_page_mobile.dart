import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/view/common/effect_list_item.dart';

class HomePageMobile extends StatelessWidget {
  final SparkARState state;

  const HomePageMobile(this.state);

  @override
  Widget build(BuildContext context) {
    print("Build HomePageMobile!");
    final flattenList =
        state.userList.expand((e) => [e.name, ...e.effects]).toList();

    return Container(
        child: RepaintBoundary(
            child: ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: flattenList.length,
      itemBuilder: (context, index) {
        final elem = flattenList[index];
        if (elem is SparkAREffect) {
          return RepaintBoundary(
              child: EffectListItem(
            effect: elem,
          ));
        }
        return getTitleItemList(elem);
      },
    )));
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
