import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/view/common/effect_list_item.dart';

class HomePageMobile extends StatelessWidget {
  final SparkARState state;

  HomePageMobile(this.state);

  @override
  Widget build(BuildContext context) {
    print("Build HomePageMobile!");
    final flattenList =
        state.userList.expand((e) => [e.name, ...e.effects]).toList();

    return Container(
        child: ListView.builder(
      padding: EdgeInsets.all(16),
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
  }

  Column getTitleItemList(Object elem) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        elem.toString(),
        style: TextStyle(fontSize: 45, color: Colors.white),
      ),
      SizedBox(
        height: 8,
      )
    ]);
  }
}
