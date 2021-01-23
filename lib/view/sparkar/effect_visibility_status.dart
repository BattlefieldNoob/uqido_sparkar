import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'effect_visibility_status.viewmodel.dart';

class EffectVisibilityStatus extends StatelessWidget {
  final String submissionStatus;
  final String visibilityStatus;
  final bool isDeprecated;

  EffectVisibilityStatus(
      this.submissionStatus, this.visibilityStatus, this.isDeprecated);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(
        width: 1,
      ),
      CircleAvatar(
        backgroundColor:
            mapStatusToColor(visibilityStatus, submissionStatus, isDeprecated),
        radius: 4,
      ),
      const SizedBox(
        width: 4,
      ),
      Text(mapStatusToText(visibilityStatus, submissionStatus, isDeprecated),
          style: const TextStyle(height: 1.1, fontSize: 12))
    ]);
  }
}
