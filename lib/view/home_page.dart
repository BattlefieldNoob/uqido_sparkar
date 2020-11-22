import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
/*import 'package:uqido_sparkar/view/desktop/home_page_desktop.dart'
    deferred as desktopPage;
import 'package:uqido_sparkar/view/mobile/home_page_mobile.dart'
    deferred as mobilePage;*/

class HomePageProvider extends StatelessWidget {
  final Future<Widget> desktopScreen;
  final Future<Widget> mobileScreen;

  Widget latest;

  HomePageProvider({Key key, @required this.desktopScreen, this.mobileScreen})
      : super(key: key);

  Future<Widget> getHomePage(ResponsiveBreakpoint active) {
    if (active.name == DESKTOP) {
      return desktopScreen;
    } else {
      return mobileScreen ?? desktopScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final active = ResponsiveWrapper.of(context).activeBreakpoint;

        return FutureBuilder(
          future: getHomePage(active),
          initialData: SizedBox(),
          builder: (context, snapshot) => snapshot.data,
        );
      },
    );
  }
/*
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
  }*/
}
