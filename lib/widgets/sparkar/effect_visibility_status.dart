import 'package:flutter/material.dart';
import 'package:extensions/text_widget.dart';

part 'effect_visibility_status.viewmodel.dart';

class EffectVisibilityStatus extends StatelessWidget {
  final Color circleColor;
  final String status;

  EffectVisibilityStatus(
      String submissionStatus, String visibilityStatus, bool isDeprecated):
      circleColor = mapStatusToColor(visibilityStatus, submissionStatus, isDeprecated),
      status = mapStatusToText(visibilityStatus, submissionStatus, isDeprecated);


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 1,
      ),
      CircleAvatar(
        backgroundColor: circleColor,
        radius: 5,
      ),
      const SizedBox(
        width: 4,
      ),
      status.b2
    ]);
  }
}
