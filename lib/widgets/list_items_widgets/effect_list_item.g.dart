// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'effect_list_item.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class ClickableIcon extends StatelessWidget {
  const ClickableIcon(
    this.icon,
    this.url, {
    Key? key,
    this.enabled = true,
    this.primary = true,
  }) : super(key: key);

  final IconData icon;

  final String url;

  final bool enabled;

  final bool primary;

  @override
  Widget build(BuildContext _context) => clickableIcon(
        _context,
        icon,
        url,
        enabled: enabled,
        primary: primary,
      );
}
