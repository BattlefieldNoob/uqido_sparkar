
extension StringExtension on String {
  String toLowerCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String truncateTo(final int maxLength) =>
      (length <= maxLength) ? this : '${substring(0, maxLength)}...';
}