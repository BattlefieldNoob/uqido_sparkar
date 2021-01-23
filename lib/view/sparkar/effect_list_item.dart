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

const Color disabledColor = const Color.fromRGBO(48, 46, 50, 1.0);

class EffectListItem extends StatelessWidget {
  final SparkAREffect effect;

  const EffectListItem({Key key, this.effect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EffectCardScaffold(
      child: ListTile(
        dense: false,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Image.network(
          effect.iconUrl,
          width: 48,
          height: 48,
        ),
        title: Text(effect.name),
        subtitle: EffectVisibilityStatus(effect.submissionStatus,
            effect.visibilityStatus, effect.isDeprecated),
        trailing: FittedBox(
            alignment: Alignment.centerRight,
            child: Row(children: [
              ClickableIcon(Icons.public_rounded, effect.publicLink,
                  enabled: mapStatusToBool()),
              const SizedBox(
                width: 8,
              ),
              ClickableIcon(Icons.home, effect.testLink, primary: false)
            ])),
      ),
    );
  }

  bool mapStatusToBool() {
    final visibility = effect.visibilityStatus;
    final submission = effect.submissionStatus;
    if (visibility == "NOT_VISIBLE" ||
        submission == "NOT_APPROVED" ||
        submission == "NOT_REVIEWED" ||
        effect.isDeprecated)
      return false;
    else if ((visibility == "VISIBLE" && submission == "UPDATE_REJECTED") ||
        (visibility == "VISIBLE" && submission == "APPROVED"))
      return true;
    else
      return false;
  }
}

@swidget
Widget clickableIcon(BuildContext context, IconData icon, String url,
    {bool enabled = true, bool primary = true}) {
  var enabledColor = Theme.of(context).accentColor;
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: enabled
              ? BorderSide(width: 3, color: enabledColor)
              : const BorderSide(width: 3, color: disabledColor),
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
Widget effectCardScaffold({Widget child}) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: child);
}
