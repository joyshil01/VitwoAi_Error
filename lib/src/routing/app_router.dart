import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/Splash/presentation/SplashScreen.dart';
import '../features/error_Details/presentation/errorDetalis_Screen.dart';

class RoutesClass {
  static String home = '/';
  static String getHomeRoute() => home;
  static String errordetails = '/errordetails';
  static String getErordetailsRoute() => errordetails;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => SplashScreen(),
    ),
    GetPage(
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
      name: errordetails,
      page: () => ErrorDetails_Screen(),
    ),
  ];
}
