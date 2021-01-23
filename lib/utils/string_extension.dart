extension StringExtension on String {
  String toLowerCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String truncateTo(final int maxLength) =>
      (this.length <= maxLength) ? this : '${this.substring(0, maxLength)}...';
}
