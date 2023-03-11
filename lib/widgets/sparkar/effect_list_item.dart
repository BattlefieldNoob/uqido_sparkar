import 'package:extensions/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:sparkar_data_model/sparkar_effect.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets/squared_card.dart';

import 'effect_visibility_status.dart';

part 'effect_list_item.g.dart';
part 'effect_list_item.viewmodel.dart';

class EffectGridItem extends ConsumerWidget {
  const EffectGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effect = ref.watch(currentEffect);

    return SquaredCard(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox.square(
              child: Image.network(effect.iconUrl),
              dimension: 48,
            ),
            IconButton(
                onPressed: () => ref
                    .read(sparkARDataProvider.notifier)
                    .toggleFavorite(effect.id),
                icon: Icon(effect.isPreferite ? Icons.star : Icons.star_border))
          ]),
          spacing(),
          effect.name.b1,
          spacing(),
          EffectVisibilityStatus(effect.submissionStatus,
              effect.visibilityStatus, effect.isDeprecated),
        ],
      ),
      footerWidgets: [
        ClickableIcon(Icons.public_rounded, effect.publicLink,
            enabled: mapStatusToBool(effect)),
        const SizedBox(
          width: 8,
        ),
        ClickableIcon(Icons.home, effect.testLink, primary: false)
      ],
    );
  }

  SizedBox spacing() {
    return const SizedBox.square(
      dimension: 8,
    );
  }
}

@swidget
Widget clickableIcon(BuildContext context, IconData icon, String url,
    {bool enabled = true, bool primary = true}) {
  var colorScheme = Theme.of(context).colorScheme;
  var enabledColor = colorScheme.secondary;
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: primary
              ? enabled
                  ? enabledColor
                  : enabledColor.withOpacity(0.3)
              : null,
          minimumSize: const Size(54, 54)),
      child: Center(child: Icon(icon, color: colorScheme.onSecondary)),
      onPressed: enabled ? () => launch(url) : null);
}
