// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(),
      );
    },
    EffectRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EffectRouteArgs>(
          orElse: () => EffectRouteArgs(effectId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EffectPage(effectId: args.effectId),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EffectPage]
class EffectRoute extends PageRouteInfo<EffectRouteArgs> {
  EffectRoute({
    required String effectId,
    List<PageRouteInfo>? children,
  }) : super(
          EffectRoute.name,
          args: EffectRouteArgs(effectId: effectId),
          rawPathParams: {'id': effectId},
          initialChildren: children,
        );

  static const String name = 'EffectRoute';

  static const PageInfo<EffectRouteArgs> page = PageInfo<EffectRouteArgs>(name);
}

class EffectRouteArgs {
  const EffectRouteArgs({required this.effectId});

  final String effectId;

  @override
  String toString() {
    return 'EffectRouteArgs{effectId: $effectId}';
  }
}
