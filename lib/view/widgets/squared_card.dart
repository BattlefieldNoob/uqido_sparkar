import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SquaredCard extends StatelessWidget {
  final Widget body;
  final List<Widget> footerWidgets;

  SquaredCard({Key? key, required this.body, required this.footerWidgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context).backgroundColor;
    return Container(
        decoration: BoxDecoration(
            color: currentTheme,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [body, Row(mainAxisAlignment: MainAxisAlignment.end, children: footerWidgets)],
            )));
  }
}
