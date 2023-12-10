import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:language_translate/home_screen.dart';
import 'package:language_translate/menu_screen.dart';
import 'package:language_translate/post_now.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        name: RouteNames.myHomePage,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage();
        },
        routes: [
          GoRoute(
            name: RouteNames.menuScreen,
            path: 'MenuScreen/:name',
            builder: (BuildContext context, GoRouterState state) {
              return MenuScreen(name: state.pathParameters["name"]!);
            },
          ),
          GoRoute(
            name: RouteNames.postNowData,
            path: 'postnow',
            builder: (BuildContext context, GoRouterState state) {
              return const PostNowData();
            },
          ),
        ]),
  ],
);

class RouteNames {
  static const myHomePage = "MyHomePage";
  static const postNowData = "MenuScreen";
  static const menuScreen = "PostNowData";
}
