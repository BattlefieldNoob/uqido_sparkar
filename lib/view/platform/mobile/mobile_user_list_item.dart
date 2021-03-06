import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.actions.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

class MobileUserListItem extends StatelessWidget {
  const MobileUserListItem(
      {Key? key,
      required this.userList,
      required this.i,
      required this.selected})
      : super(key: key);

  final List<SparkARUser> userList;
  final int i;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(userList[i].iconUrl),
        title: Text(
          userList[i].name,
          style: selected == i
              ? TextStyle(color: Color.fromRGBO(20, 92, 255, 1))
              : null,
        ),
        selected: selected == i,
        selectedTileColor:
            Theme.of(context).navigationRailTheme.backgroundColor,
        onTap: () {
          context.read<SparkARBloc>().add(SparkARAction.selectUser(i));
          Navigator.pop(context);
        });
  }
}
