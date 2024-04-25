import 'package:get/get.dart';
import 'package:machine_test_srv/View/home_screen.dart';
import 'package:machine_test_srv/View/splash_screen.dart';

class RouteManager {
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';
  List<GetPage> _routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
    ),
  ];

  get routes => _routes;
}
