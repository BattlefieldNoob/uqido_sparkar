import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';

import 'effect_list_item.dart';

class UserEffectDetail extends StatelessWidget {
  final List<SparkAREffect> effects;

  const UserEffectDetail({Key key, this.effects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: ListView.builder(
            itemCount: effects.length,
            itemBuilder: (context, index) => EffectListItem(
                  effect: effects[index],
                )));
  }
}
