import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        backgroundColor: mapStatusToColor(),
        radius: 4,
      ),
      const SizedBox(
        width: 4,
      ),
      Text(mapStatusToText(), style: const TextStyle(height: 1.1, fontSize: 12))
    ]);
  }

  Color mapStatusToColor() {
    if (visibilityStatus == "NOT_VISIBLE" ||
        submissionStatus == "NOT_APPROVED" ||
        submissionStatus == "NOT_REVIEWED" ||
        isDeprecated)
      //worst case
      return Colors.red;
    else if (visibilityStatus == "VISIBLE" &&
        submissionStatus == "UPDATE_REJECTED")
      return Colors.orangeAccent;
    else if (visibilityStatus == "VISIBLE" && submissionStatus == "APPROVED")
      return Colors.green;
    else
      return Colors.blue;
  }

  String mapStatusToText() {
    if (visibilityStatus == "NOT_VISIBLE")
      return "Non visibile";
    else if (submissionStatus == "NOT_APPROVED" ||
        submissionStatus == "NOT_REVIEWED")
      return "Non approvato";
    else if (isDeprecated)
      return "Deprecato";
    else if (visibilityStatus == "VISIBLE" &&
        submissionStatus == "UPDATE_REJECTED")
      return "Ultimo update rifiutato";
    else if (visibilityStatus == "VISIBLE" && submissionStatus == "APPROVED")
      return "Visibile";
    else
      return "Caso eccezionale, fix me please!";
  }
}
