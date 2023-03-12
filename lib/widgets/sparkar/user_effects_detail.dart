import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sparkar_data_model/owner.dart';

import 'effect_list_item.dart';

class UserEffectDetail extends StatelessWidget {
  final Owner user;

  const UserEffectDetail(this.user);

  @override
  Widget build(BuildContext context) {
    final effects = user.effects;

    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 64),
        itemCount: effects.length,
        itemBuilder: (context, index) => EffectGridItem());
  }
}
