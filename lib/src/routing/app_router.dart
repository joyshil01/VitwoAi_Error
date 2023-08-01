import 'package:error/src/widget/navBottom.dart';
import 'package:get/get.dart';
import '../features/Splash/presentation/SplashScreen.dart';
import '../features/error_Details/presentation/errorDetalis_Screen.dart';

class RoutesClass {
  static String home = '/';
  static String getHomeRoute() => home;
  static String navBottom= '/';
  static String getNavbootmRoute() => navBottom;
  static String errordetails = '/errordetails';
  static String getErordetailsRoute() => errordetails;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: navBottom,
      page: () => const MainPage(),
    ),
    GetPage(
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
      name: errordetails,
      page: () => ErrorDetails_Screen(),
    ),
  ];
}
