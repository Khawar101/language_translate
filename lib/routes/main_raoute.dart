import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:language_translate/Splash_screen.dart';
import 'package:language_translate/menu_screen.dart';
import 'package:language_translate/post_now.dart';
import 'package:language_translate/sinup_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        name: RouteNames.splashScreen,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashContainer();
        },
        routes: [
           GoRoute(
            name: RouteNames.signUpScreen,
            path: 'SignUpScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpScreen();
            },
          ),
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
   static const splashScreen = "SplashScreen";
   static const signUpScreen = "SignUpScreen";
  static const myHomePage = "MyHomePage";
  static const postNowData = "MenuScreen";
  static const menuScreen = "PostNowData";
}
