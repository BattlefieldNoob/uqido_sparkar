import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/utils/extensions.dart';
import 'package:uqido_sparkar/view/platform/mobile/widgets/squared_card.dart';
import 'package:url_launcher/url_launcher.dart';

import 'effect_visibility_status.dart';

part 'effect_list_item.g.dart';

part 'effect_list_item.viewmodel.dart';

class EffectGridItem extends StatelessWidget {
  final SparkAREffect effect;

  const EffectGridItem({Key? key, required this.effect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SquaredCard(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.square(child: Image.network(
            effect.iconUrl
          ),dimension: 48,),
          const SizedBox.square(dimension: 8,),
          effect.name.b1,
          const SizedBox.square(dimension: 8,),
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
      child: Center(
          child: Icon(icon, color: colorScheme.onSecondary)),
      onPressed: enabled ? () => launch(url) : null);
}
