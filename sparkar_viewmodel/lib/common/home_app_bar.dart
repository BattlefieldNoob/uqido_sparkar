import 'package:flutter/material.dart';
import 'package:sparkar_viewmodel/common/search_app_bar.dart';

import 'home_loading_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context).colorScheme;

    return SearchAppBar(
        primary: theme.primary,
        searchHint: "Cerca un effetto...",
        mainTextColor: theme.onPrimary,
        onSubmit: (String value) {
          //context.read<SparkARBloc>().add(SparkARAction.search(value));
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
