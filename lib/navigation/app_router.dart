import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uqido_sparkar/widgets/effect_page.dart';
import 'package:uqido_sparkar/widgets/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: EffectRoute.page, path: "/effect/:id"),
  ];
}
