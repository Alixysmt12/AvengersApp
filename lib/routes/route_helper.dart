import 'package:avengers_app/uiscreen/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../uiscreen/splash_screen.dart';

class RouteHelper {

  ///File path
  static const String splashScreen = "/front-page";
  static const String loginScreen = "/login-page";


  ///Getter of file path
  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;



  ///File path initialization
  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),

  ];
}