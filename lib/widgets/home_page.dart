import 'dart:math';

import 'package:data_model/owner.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/providers/data_provider.dart';
import 'package:uqido_sparkar/widgets/list_items_widgets/effect_list_item.dart';
import 'package:uqido_sparkar/widgets/list_items_widgets/owner_list_item.dart';
import 'package:uqido_sparkar/widgets/models/home_page_list_item.dart';

part 'home_page.g.dart';

class HomePage extends ConsumerWidget {
  const HomePage() : super(key: null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final owners = ref.watch(fetchDataProvider);

    return owners.maybeWhen(
        orElse: () => CircularProgressIndicator(),
        data: (data) => HomePageEffectsList(data));
  }
}

@swidget
Widget homePageEffectsList(BuildContext context, List<Owner> owners) {
  final controller = ScrollController();

  final List<HomePageListItem> listItems = owners
      .map((owner) => [
            HomePageListItem.header(owner),
            ...owner.effects
                .map((effect) => HomePageListItem.effect(effect, owner))
          ])
      .expand((element) => element)
      .toList();

  return DraggableScrollbar.semicircle(
      //alwaysVisibleScrollThumb: true,
      labelConstraints: BoxConstraints.tightFor(width: 180, height: 28),
      labelTextBuilder: (offset) {
        final currentItem = controller.hasClients
            ? (controller.offset /
                    controller.position.maxScrollExtent *
                    listItems.length)
                .floor()
            : 0;

        final displayName =
            listItems[min(currentItem, listItems.length - 1)].map(
          header: (h) => h.owner.displayName,
          effect: (e) => e.owner.displayName,
        );
        return Text(
          "$displayName",
          style: TextStyle(color: Colors.black),
        );
      },
      child: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) => listItems[index].map(
          header: (h) => OwnerListItem(h.owner),
          effect: (e) => EffectListItem(e.effect),
        ),
        itemCount: listItems.length,
      ),
      controller: controller);
}
