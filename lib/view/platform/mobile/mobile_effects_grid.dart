import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/sparkar/effect_list_item.dart';

part 'mobile_effects_grid.g.dart';

class MobileEffectsGrid extends StatelessWidget {
  final SparkARUser user;

  const MobileEffectsGrid(this.user) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final paletteFuture =
        PaletteGenerator.fromImageProvider(NetworkImage(user.iconUrl));

    return FutureBuilder(
        future: paletteFuture,
        builder:
            (BuildContext context, AsyncSnapshot<PaletteGenerator> snapshot) {
          if (snapshot.hasError) {
            return ColoredGridView(user.effects, Colors.amberAccent.shade100);
          } else if (snapshot.hasData) {
            final color = snapshot.data?.dominantColor?.color ?? Colors.red;
            return ColoredGridView(user.effects, color);
          } else {
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
        });
  }
}

@swidget
Widget coloredGridView(List<SparkAREffect> effects, Color tileColor) {
  return GridView(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
      children: [
        ...effects.map((e) => EffectListItem(effect: e, tileColor: tileColor))
      ]);
}
