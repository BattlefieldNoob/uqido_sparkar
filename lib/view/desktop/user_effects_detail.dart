import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

import '../common/effect_list_item.dart';

class UserEffectDetail extends StatelessWidget {
  final SparkARUser user;

  const UserEffectDetail(this.user);

  @override
  Widget build(BuildContext context) {
    final effects = user.effects;

    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemCount: effects.length,
        itemBuilder: (context, index) => EffectListItem(
              effect: effects[index],
            ));
  }
}
