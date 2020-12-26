import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uqido_sparkar/utils/string_extension.dart';
import 'package:uqido_sparkar/view/common/scollable_bottom_navigation_bar.dart';

const _tabletBreakpoint = 720.0;
const _desktopBreakpoint = 1440.0;
const _minHeight = 400.0;
const _drawerWidth = 350.0;
const _railSize = 92.0;
const _denseRailSize = 72.0;

class NavRail extends StatelessWidget {
  final FloatingActionButton floatingActionButton;
  final int currentIndex;
  final Widget body;
  final Widget title;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> tabs;
  final WidgetBuilder drawerHeaderBuilder, drawerFooterBuilder;
  final Color bottomNavigationBarColor;
  final double tabletBreakpoint, desktopBreakpoint, minHeight, drawerWidth;
  final ScrollableBottomNavigationBarType bottomNavigationBarType;
  final Color bottomNavigationBarSelectedColor,
      bottomNavigationBarUnselectedColor;
  final bool isDense;
  final bool hideTitleBar;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PreferredSizeWidget appBar;

  const NavRail({
    Key key,
    @required this.currentIndex,
    @required this.tabs,
    @required this.onTap,
    this.scaffoldKey,
    this.appBar,
    this.isDense = false,
    this.floatingActionButton,
    this.drawerFooterBuilder,
    this.drawerHeaderBuilder,
    this.body,
    this.title,
    this.bottomNavigationBarColor,
    this.tabletBreakpoint = _tabletBreakpoint,
    this.desktopBreakpoint = _desktopBreakpoint,
    this.drawerWidth = _drawerWidth,
    this.bottomNavigationBarType = ScrollableBottomNavigationBarType.fixed,
    this.bottomNavigationBarSelectedColor,
    this.bottomNavigationBarUnselectedColor,
    this.minHeight = _minHeight,
    this.hideTitleBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context),
      child: LayoutBuilder(
        builder: (_, dimens) {
          if (dimens.maxWidth >= desktopBreakpoint &&
              dimens.maxHeight > minHeight) {
            return _buildDesktopScaffold(context);
          }
          if (dimens.maxWidth >= tabletBreakpoint &&
              dimens.maxHeight > minHeight) {
            return _buildTabletScaffold(context);
          }
          return _buildMobileScaffold(context);
        },
      ),
    );
  }

  Scaffold _buildMobileScaffold(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: hideTitleBar ? null : appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: ScrollableBottomNavigationBar(
          type: bottomNavigationBarType,
          backgroundColor: bottomNavigationBarColor,
          currentIndex: currentIndex,
          onTap: onTap,
          items: tabs,
          unselectedItemColor: bottomNavigationBarUnselectedColor,
          selectedItemColor: bottomNavigationBarSelectedColor,
        ));
  }

  Scaffold _buildTabletScaffold(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: hideTitleBar ? null : appBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Row(
        children: <Widget>[
          ConstrainedBox(
            child: buildRail(context, false, false),
            constraints: BoxConstraints.tightFor(
                width: isDense ? _denseRailSize : _railSize),
          ),
          Expanded(child: body),
        ],
      ),
    );
  }

  Material _buildDesktopScaffold(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        appBar: hideTitleBar ? null : appBar,
        body: Row(children: <Widget>[
          Container(
            width: drawerWidth,
            child: _buildDrawer(context, true),
          ),
          Expanded(
            child: body,
          ),
        ]),
      ),
    );
  }

  NavigationRail buildRail(
      BuildContext context, bool isDesktop, bool extended) {
    return NavigationRail(
      extended: extended,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      minWidth: isDense ? _denseRailSize : _railSize,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).accentColor,
      ),
      unselectedLabelTextStyle: TextStyle(fontSize: isDesktop ? 20 : 14),
      selectedLabelTextStyle: TextStyle(
          color: Theme.of(context).accentColor, fontSize: isDesktop ? 22 : 15),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      labelType: extended ? null : NavigationRailLabelType.all,
      selectedIndex: currentIndex,
      elevation: 3,
      onDestinationSelected: (val) => onTap(val),
      destinations: tabs
          .map((e) => NavigationRailDestination(
                selectedIcon: Container(
                    child: Padding(padding: EdgeInsets.all(2), child: e.icon),
                    color: Theme.of(context).accentColor),
                label: Text(
                  e.label.toLowerCapitalize(),
                  overflow: TextOverflow.ellipsis,
                ),
                icon: e.icon,
              ))
          .toList(),
    );
  }

  Widget _buildDrawer(BuildContext context, bool showTabs) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            if (drawerHeaderBuilder != null) ...[
              drawerHeaderBuilder(context),
            ],
            if (showTabs) ...[
              Expanded(child: buildRail(context, true, true)),
            ],
            if (drawerFooterBuilder != null) ...[
              drawerFooterBuilder(context),
            ],
          ],
        ),
      ),
    );
  }
}
