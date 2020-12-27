import 'package:flutter/material.dart';

class BottomDrawer extends StatelessWidget {
  const BottomDrawer({
    Key key,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: Material(
        color: theme.bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const SizedBox(height: 28),
            leading,
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
