import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'effect_list_item.dart';

class UserListItem extends StatelessWidget {
  final SparkARUser user;

  const UserListItem({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: ConstrainedBox(
            constraints: new BoxConstraints(minHeight: 35.0, maxHeight: 900.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,style: TextStyle(fontSize: 45,color: Colors.white),),
              SizedBox(height: 8,),
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: user.effects.length,
                itemBuilder: (context, index) => EffectListItem(
                  effect: user.effects[index],
                ),
              ))
            ])));
  }
}
