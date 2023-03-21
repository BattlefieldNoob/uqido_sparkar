part of 'effect_visibility_status.dart';

Color mapStatusToColor(final String visibilityStatus,
    final String submissionStatus, final bool isDeprecated) {
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

String mapStatusToText(final String visibilityStatus,
    final String submissionStatus, final bool isDeprecated) {
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
