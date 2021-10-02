import 'package:flutter/material.dart';
import 'package:uqido_sparkar/utils/ui_utils.dart';
import 'package:uqido_sparkar/view/platform/desktop/desktop_home_page.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final isTablet = isDisplaySmallDesktop(context);
    if (isDesktop) {
      return DesktopHomePage(isTablet);
    } else {
      return const MobileHomePage();
    }
  }
}
