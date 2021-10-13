import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

extension StringExtension on String {
  String toLowerCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String truncateTo(final int maxLength) =>
      (this.length <= maxLength) ? this : '${this.substring(0, maxLength)}...';
}

extension TextWidgets on String {
  Widget get h1 => Text(this, style: OneContext().textTheme.headline1);

  Widget get h2 => Text(this, style: OneContext().textTheme.headline2);

  Widget get b1 => Text(this, style: OneContext().textTheme.bodyText1);

  Widget get b2 => Text(this, style: OneContext().textTheme.bodyText2);

  Widget themeH1(ThemeData theme) => Text(this, style: theme.textTheme.headline1);

  Widget themeH2(ThemeData theme) => Text(this, style: theme.textTheme.headline2);

  Widget themeB1(ThemeData theme) => Text(this, style: theme.textTheme.bodyText1);

  Widget themeB2(ThemeData theme) => Text(this, style: theme.textTheme.bodyText2);
}
