// import 'package:error/src/widget/navBottom.dart';
// import 'package:get/get.dart';
// import '../features/Splash/presentation/SplashScreen.dart';
// import '../features/error_Details/presentation/errorDetalis_Screen.dart';

// class RoutesClass {
//   static String home = '/';
//   static String getHomeRoute() => home;
//   static String navBottom= '/';
//   static String getNavbootmRoute() => navBottom;
//   static String errordetails = '/errordetails';
//   static String getErordetailsRoute() => errordetails;

//   static List<GetPage> routes = [
//     GetPage(
//       name: home,
//       page: () => const SplashScreen(),
//     ),
//     GetPage(
//       name: navBottom,
//       page: () => const MainPage(),
//     ),
//     GetPage(
//       transition: Transition.zoom,
//       transitionDuration: const Duration(milliseconds: 500),
//       name: errordetails,
//       page: () => ErrorDetails_Screen(),
//     ),
//   ];
// }

import 'package:error/src/features/Splash/presentation/SplashScreen.dart';
import 'package:error/src/features/login/presentation/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/navBottom.dart';

enum AppRoute {
  login,
  home,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var userName = sharedPreferences.getString('userName');
    var userType = sharedPreferences.getString('userType');
    var userImage = sharedPreferences.getString('userImage');
    if (token != null && userName != null) {
      if (state.matchedLocation == '/') {
        return '/bottom-nav';
      }
    }
  },
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/bottom-nav',
      name: AppRoute.home.name,
      pageBuilder: (context, state) => MaterialPage(
        child: MainPage(),
        fullscreenDialog: true,
        key: state.pageKey,
      ),
    ),
  ],
);
