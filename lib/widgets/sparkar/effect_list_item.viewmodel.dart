part of 'effect_list_item.dart';

bool mapStatusToBool(final Effect effect) {
  final visibility = effect.visibilityStatus;
  final submission = effect.submissionStatus;
  if (visibility == "NOT_VISIBLE" ||
      submission == "NOT_APPROVED" ||
      submission == "NOT_REVIEWED" ||
      false)
    //effect.isDeprecated)
    return false;
  else if ((visibility == "VISIBLE" && submission == "UPDATE_REJECTED") ||
      (visibility == "VISIBLE" && submission == "APPROVED"))
    return true;
  else
    return false;
}
