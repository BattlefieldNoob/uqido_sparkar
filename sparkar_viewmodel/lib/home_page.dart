import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:extensions/text_widget.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:sparkar_providers/spark_ar_data_provider.dart';
import 'package:sparkar_viewmodel/widgets/accounts_tab_bar_view.dart';
import 'package:sparkar_viewmodel/widgets/spark_ar_custom_tab_bar.dart';

part 'home_page.g.dart';

class HomePage extends ConsumerWidget {
  const HomePage() : super(key: null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersCount);
    return DefaultTabController(
        length: users + 1,
        initialIndex: users == 0 ? 0 : 1,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(220),
                child: MobileHomePageAppBar(ref)),
            body: MobileHomePageBody()));
  }
}

@swidget
Widget mobileHomePageAppBar(BuildContext context, WidgetRef ref) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: const Icon(Icons.menu),
    actions: [
      Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () async {
                final a = ref.read(repositoryProvider);
                if (a is AuthRepository){
                  final ds=a as AuthRepository;
                  await ds.logout();
                  ref.refresh(authProvider);
                }
              }, icon: const Icon(Icons.account_circle)))
    ],
    elevation: 0,
    bottom: PreferredSize(
      preferredSize: const Size(0.0, 80.0),
        child: ConstrainedBox(
            //constraints: BoxConstraints.tightFor(width: 85.w),
            constraints: const BoxConstraints.tightFor(width: 1532),
            child: const SparkARCustomTabBar())),
  );
}

@swidget
Widget mobileHomePageBody(BuildContext context) {
  return Center(
      child: ConstrainedBox(
          //constraints: BoxConstraints.tightFor(width: 85.w),
          constraints: const BoxConstraints.tightFor(width: 1532),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: "Effects".h2,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              const Expanded(child: AccountsTabBarView())
            ],
          )));
}
