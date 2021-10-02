import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:url_launcher/url_launcher.dart';

import 'effect_visibility_status.dart';

part 'effect_list_item.g.dart';
part 'effect_list_item.viewmodel.dart';

const Color disabledColor = const Color.fromRGBO(48, 46, 50, 1.0);

class EffectGridItem extends StatelessWidget {
  final SparkAREffect effect;
  final Color tileColor;

  const EffectGridItem(
      {Key? key, required this.effect, required this.tileColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EffectCardScaffold(
      tileColor: tileColor,
      child: Padding(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            effect.iconUrl,
            width: 48,
            height: 48,
          ),
          Text(effect.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          EffectVisibilityStatus(effect.submissionStatus,
              effect.visibilityStatus, effect.isDeprecated),
          Spacer(),
          Row(
            children: [
              Spacer(),
              FittedBox(
                  alignment: Alignment.centerRight,
                  child: Row(children: [
                    ClickableIcon(Icons.public_rounded, effect.publicLink,
                        enabled: mapStatusToBool(effect)),
                    const SizedBox(
                      width: 8,
                    ),
                    ClickableIcon(Icons.home, effect.testLink, primary: false)
                  ])),
            ],
          )
        ]),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}

@swidget
Widget clickableIcon(BuildContext context, IconData icon, String url,
    {bool enabled = true, bool primary = true}) {
  var enabledColor = Theme.of(context).accentColor;
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: primary
              ? enabled
                  ? enabledColor
                  : disabledColor
              : null,
          minimumSize: const Size(54, 54)),
      child: Center(
          child: Icon(icon, color: enabled ? Colors.white70 : Colors.white30)),
      onPressed: enabled ? () => launch(url) : null);
}

@swidget
Widget effectCardScaffold({required Widget child, required Color tileColor}) {
  return Container(
      decoration: BoxDecoration(
          color: tileColor, borderRadius: BorderRadius.circular(10)),
      child: child);
}
