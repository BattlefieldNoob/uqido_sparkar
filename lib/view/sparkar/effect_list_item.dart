import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:url_launcher/url_launcher.dart';

import 'effect_visibility_status.dart';

class EffectListItem extends StatelessWidget {
  static const Color disabledColor = const Color.fromRGBO(48, 46, 50, 1.0);

  final SparkAREffect effect;

  const EffectListItem({Key key, this.effect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getCardScaffold(
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
              getClickableIcon(context, Icons.public_rounded, effect.publicLink,
                  enabled: mapStatusToBool()),
              const SizedBox(
                width: 8,
              ),
              getClickableIcon(context, Icons.home, effect.testLink,
                  primary: false)
            ])),
      ),
    );
  }

  Widget getClickableIcon(BuildContext context, IconData icon, String url,
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
            child:
                Icon(icon, color: enabled ? Colors.white70 : Colors.white30)),
        onPressed: enabled ? () => launch(url) : null);
  }

  Widget getCardScaffold({Widget child}) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: child);
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
