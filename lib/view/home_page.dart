import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'user_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      context.read<SparkARBloc>().add(SparkAREvent.update);
    });
    return BlocBuilder<SparkARBloc, SparkARState>(builder: (_, state) {
      return Container(
          child: RefreshIndicator(
              onRefresh: () async =>
                  context.read<SparkARBloc>().add(SparkAREvent.update),
              child: ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (context, index) =>
                    UserListItem(user: state.userList[index]),
              )
          )
      );
    });
  }
}
