import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/common/home_loading_bar.dart';
import 'package:uqido_sparkar/view/common/search_app_bar.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchAppBar(
        primary: Theme.of(context).primaryColor,
        searchHint: "Cerca un effetto...",
        mainTextColor: Colors.white,
        onSubmit: (String value) {
          context.read<SparkARBloc>().add(SparkARSearchAction(value));
        },
        //Will show when SEARCH MODE wasn't active
        mainAppBar: (stream, keyword) {
          return AppBar(
              title: const Text('Uqido Spark AR'),
              actions: [
                IconButton(
                  onPressed: () {
                    stream.add(true);
                  },
                  icon: const Icon(Icons.search),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
              bottom: HomeLoadingBar());
        });
  }
}
