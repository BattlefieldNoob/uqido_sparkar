import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/desktop/home_page_desktop.dart'
    deferred as desktopPage;
import 'package:uqido_sparkar/view/mobile/home_page_mobile.dart'
    deferred as mobilePage;

class HomePage extends StatelessWidget {
  Widget actual;

  @override
  Widget build(BuildContext context) {
    //print("homepage!");
    return HookBuilder(builder: (ctx) {
      final actual = useState<Widget>(SizedBox());
      //print("HOOKKKKKKK");
      final state = useBloc<SparkARBloc, SparkARState>(
        onEmitted: (_, prev, curr) {
          return prev.userList != curr.userList;
        },
      ).state;
      final active = ResponsiveWrapper.of(context).activeBreakpoint;
      if (actual.value is SizedBox) {
        return FutureBuilder(
          future: getHomePageWidget(active.name, state),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("data!");
              print(snapshot.data);
              actual.value = snapshot.data;
            }
            return SizedBox();
          },
        );
      }
      useValueChanged(active, (value, res) {
        print("Change Home Page!");
        if (active.name != null)
          getHomePageWidget(active.name, state)
              .then((value) => actual.value = value);
      });

      if (actual == null) return SizedBox();

      return actual.value;
    });
  }

  Future<Widget> getHomePageWidget(String screen, SparkARState state) {
    print("Get Home Page Widget!");
    if (screen == DESKTOP) {
      return desktopPage
          .loadLibrary()
          .then((value) => desktopPage.HomePageDesktop());
      //return desktopPage.HomePageDesktop(state);
    } else {
      return mobilePage
          .loadLibrary()
          .then((value) => mobilePage.HomePageMobile());
      //return mobilePage.HomePageMobile(state);
    }
  }
}
