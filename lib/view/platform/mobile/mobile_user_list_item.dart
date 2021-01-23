import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';

class MobileUserListItem extends StatelessWidget {
  const MobileUserListItem({
    Key key,
    @required this.state,
    @required this.i,
  }) : super(key: key);

  final SparkARState state;
  final int i;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(state.userList[i].iconUrl),
        title: Text(
          state.userList[i].name,
          style: state.selected == i
              ? TextStyle(color: Color.fromRGBO(20, 92, 255, 1))
              : null,
        ),
        selected: state.selected == i,
        selectedTileColor:
            Theme.of(context).navigationRailTheme.backgroundColor,
        onTap: () {
          context.read<SparkARBloc>().add(SparkARSelectUserAction(i));
          Navigator.pop(context);
        });
  }
}
