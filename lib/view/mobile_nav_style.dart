import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/user_effects_detail.dart';

import 'bottom_drawer.dart';

class MobileNav extends StatefulWidget {
  const MobileNav(
      {this.selectedIndex,
      this.destinations,
      this.onItemTapped,
      this.state,
      this.appbar});

  final int selectedIndex;
  final List<NavigationRailDestination> destinations;
  final void Function(int, String) onItemTapped;
  final SparkARState state;
  final Widget appbar;

  @override
  MobileNavState createState() => MobileNavState();
}

const double _kFlingVelocity = 2.0;
const _kAnimationDuration = Duration(milliseconds: 300);

class MobileNavState extends State<MobileNav> with TickerProviderStateMixin {
  final _bottomDrawerKey = GlobalKey(debugLabel: 'Bottom Drawer');

  AnimationController _drawerController;
  AnimationController _dropArrowController;
  AnimationController _bottomAppBarController;
  Animation<double> _drawerCurve;

  @override
  void initState() {
    super.initState();
    _drawerController = AnimationController(
      duration: _kAnimationDuration,
      value: 0,
      vsync: this,
    )..addListener(() {
        if (_drawerController.value < 0.01) {
          setState(() {
            //Reload state when drawer is at its smallest to toggle visibility
            //If state is reloaded before this drawer closes abruptly instead
            //of animating.
          });
        }
      });

    _dropArrowController = AnimationController(
      duration: _kAnimationDuration,
      vsync: this,
    );

    _bottomAppBarController = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 250),
    );

    _drawerCurve = CurvedAnimation(
      parent: _drawerController,
      curve: standardEasing,
      reverseCurve: standardEasing.flipped,
    );
  }

  @override
  void dispose() {
    _drawerController.dispose();
    _dropArrowController.dispose();
    _bottomAppBarController.dispose();
    super.dispose();
  }

  bool get _bottomDrawerVisible {
    final status = _drawerController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBottomDrawerVisibility() {
    if (_drawerController.value < 0.4) {
      _drawerController.animateTo(0.4, curve: standardEasing);
      _dropArrowController.animateTo(0.35, curve: standardEasing);
      return;
    }

    _dropArrowController.forward();
    _drawerController.fling(
      velocity: _bottomDrawerVisible ? -_kFlingVelocity : _kFlingVelocity,
    );
  }

  double get _bottomDrawerHeight {
    final renderBox =
        _bottomDrawerKey.currentContext.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _drawerController.value -= details.primaryDelta / _bottomDrawerHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_drawerController.isAnimating ||
        _drawerController.status == AnimationStatus.completed) {
      return;
    }

    final flingVelocity =
        details.velocity.pixelsPerSecond.dy / _bottomDrawerHeight;

    if (flingVelocity < 0.0) {
      _drawerController.fling(
        velocity: math.max(_kFlingVelocity, -flingVelocity),
      );
    } else if (flingVelocity > 0.0) {
      _dropArrowController.forward();
      _drawerController.fling(
        velocity: math.min(-_kFlingVelocity, -flingVelocity),
      );
    } else {
      if (_drawerController.value < 0.6) {
        _dropArrowController.forward();
      }
      _drawerController.fling(
        velocity:
            _drawerController.value < 0.6 ? -_kFlingVelocity : _kFlingVelocity,
      );
    }
  }

  Widget _buildStack(
      BuildContext context, BoxConstraints constraints, SparkARState state) {
    final drawerSize = constraints.biggest;
    final drawerTop = drawerSize.height;

    final drawerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, drawerTop, 0.0, 0.0),
      end: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_drawerCurve);

    return Stack(
      clipBehavior: Clip.none,
      key: _bottomDrawerKey,
      children: [
        Expanded(child: UserEffectDetail(state.userList[state.selectedIndex])),
        GestureDetector(
          onTap: () {
            _drawerController.reverse();
            _dropArrowController.reverse();
          },
          child: Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: _bottomDrawerVisible,
            child: FadeTransition(
              opacity: _drawerCurve,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).bottomSheetTheme.modalBackgroundColor,
              ),
            ),
          ),
        ),
        PositionedTransition(
          rect: drawerAnimation,
          child: Visibility(
            visible: _bottomDrawerVisible,
            child: BottomDrawer(
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              leading: _BottomDrawerDestinations(
                destinations: widget.state.userList,
                drawerController: _drawerController,
                dropArrowController: _dropArrowController,
                selectedIndex: widget.selectedIndex,
                onItemTapped: widget.onItemTapped,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: widget.appbar,
        body: LayoutBuilder(
          builder: (ctx, constraints) =>
              _buildStack(ctx, constraints, widget.state),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 6,
          child: Container(
            color: Colors.transparent,
            height: kToolbarHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  onTap: _toggleBottomDrawerVisibility,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        /*floatingActionButton: _bottomDrawerVisible
            ? null
            : const Padding(
                padding: EdgeInsetsDirectional.only(bottom: 8),
                child: _ReplyFab(),
              ),*/
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
  }
}

class _BottomDrawerDestinations extends StatelessWidget {
  _BottomDrawerDestinations({
    @required this.destinations,
    @required this.drawerController,
    @required this.dropArrowController,
    @required this.selectedIndex,
    @required this.onItemTapped,
  })  : assert(destinations != null),
        assert(drawerController != null),
        assert(dropArrowController != null),
        assert(selectedIndex != null),
        assert(onItemTapped != null);

  final List<SparkARUser> destinations;
  final AnimationController drawerController;
  final AnimationController dropArrowController;
  final int selectedIndex;
  final void Function(int, String) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < destinations.length; i++)
          InkWell(
            onTap: () {
              drawerController.reverse();
              dropArrowController.forward();
              Future.delayed(
                Duration(milliseconds: 300),
                () {
                  // Wait until animations are complete to reload the state.
                  // Delay scales with the timeDilation value of the gallery.
                  onItemTapped(i, destinations[i].name);
                },
              );
            },
            child: ListTile(
              leading: Image.network(destinations[i].iconUrl),
              title: Text(destinations[i].name),
            ),
          ),
      ],
    );
  }
}
