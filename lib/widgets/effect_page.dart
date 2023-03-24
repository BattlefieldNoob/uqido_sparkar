import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_model/effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uqido_sparkar/providers/data_provider.dart';

part 'effect_page.g.dart';

@riverpod
Effect? getEffectById(GetEffectByIdRef ref, String id) {
  return ref.watch(fetchDataProvider).whenOrNull(
      data: (data) => data
          .expand((owner) => owner.effects)
          .firstWhere((effect) => effect.id == id));
}

@RoutePage()
class EffectPage extends ConsumerWidget {
  final String effectId;

  const EffectPage({@PathParam('id') required this.effectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effect = ref.watch(getEffectByIdProvider(effectId));

    if (effect == null) {
      return CircularProgressIndicator();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(context.topRoute.name),
          leading: AutoLeadingButton(),
        ),
        body: Container(
          child: Text(effect.name),
        ));
  }
}
