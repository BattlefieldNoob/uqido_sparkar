import 'dart:math';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:extensions/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/providers/data_provider.dart';
import 'package:uqido_sparkar/widgets/widgets/accounts_tab_bar_view.dart';
import 'package:uqido_sparkar/widgets/widgets/spark_ar_custom_tab_bar.dart';

part 'home_page.g.dart';

class HomePage extends ConsumerWidget {
  const HomePage() : super(key: null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owners = ref.watch(fetchDataProvider);

    final controller = ScrollController();
    return owners.maybeWhen(
        orElse: () => CircularProgressIndicator(),
        data: (data) {
          return DraggableScrollbar.semicircle(
              alwaysVisibleScrollThumb: true,
              labelTextBuilder: (offset) {
                final currentItem = controller.hasClients
                    ? (controller.offset /
                            controller.position.maxScrollExtent *
                            data.length)
                        .floor()
                    : 0;

                final name =
                    data[min(currentItem, data.length - 1)].displayName;
                return Text(
                  "$name",
                  style: TextStyle(color: Colors.black),
                );
              },
              child: ListView.builder(
                controller: controller,
                itemBuilder: (context, index) => Text(
                  data[index].displayName,
                  style: TextStyle(fontSize: 60),
                ),
                itemCount: data.length,
              ),
              controller: controller);
        });
  }
}

@swidget
Widget mobileHomePageAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: const Icon(Icons.menu),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              const Expanded(child: AccountsTabBarView())
            ],
          )));
}
