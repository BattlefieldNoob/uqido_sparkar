import 'package:flutter/material.dart';
import 'package:uqido_sparkar/develop/side_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SideNavigationBar(),
            SizedBox(
              width: 200,
              height: 200,
            )
          ],
        ),
      )));
}

class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxWidth);
          if (constraints.maxWidth < 400)
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [SideNavigationBarThin()],
            );
          else
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [SideNavigationBarExpanded()],
            );
        },
      ),
    );
  }
}
