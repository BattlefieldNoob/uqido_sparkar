import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:sparkar_data_model/effect.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'effect_visibility_status.dart';

part 'effect_list_item.g.dart';
part 'effect_list_item.viewmodel.dart';

class EffectListItem extends StatelessWidget {
  final Effect effect;

  const EffectListItem(this.effect, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          dense: false,
          contentPadding: const EdgeInsets.all(16),
          leading: SizedBox.square(
            child: Image.network(effect.thumbnailUri),
            dimension: 48,
          ),
          tileColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(effect.name, style: TextStyle(fontSize: 16)),
          subtitle: EffectVisibilityStatus(effect.submissionStatus,
              effect.visibilityStatus, /* effect.isDeprecated*/ false),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClickableIcon(Icons.public_rounded, effect.shareLink,
                  enabled: mapStatusToBool(effect)),
              const SizedBox(
                width: 8,
              ),
              ClickableIcon(Icons.home, effect.testLink, primary: false)
            ],
          ),
        ));
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
          minimumSize: const Size(48, 48)),
      child: Center(child: Icon(icon, color: colorScheme.onSecondary)),
      onPressed: enabled ? () => launchUrlString(url) : null);
}
