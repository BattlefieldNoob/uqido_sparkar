import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class WidgetsGrid extends StatelessWidget {
  final Widget Function(BuildContext,int) builder;
  final int itemCount;

  const WidgetsGrid(this.builder,this.itemCount) : super(key: null);

  @override
  Widget build(BuildContext context) {
    if (itemCount==0) {
      return const Center(
        child: Text("No Elements!"),
      );
    } else {
      final layoutData = ResponsiveWrapper.of(context);

      final columns = layoutData.isMobile
          ? 2
          : layoutData.isTablet
              ? 3
              : 4;

      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2),
        itemCount: itemCount,
        itemBuilder: builder,
      );
    }
  }
}
