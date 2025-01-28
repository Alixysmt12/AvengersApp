import 'package:avengers_app/uiscreen/add_quick_support_tickets.dart';
import 'package:avengers_app/uiscreen/dashboard_screen.dart';
import 'package:avengers_app/uiscreen/detaile_screen.dart';
import 'package:avengers_app/uiscreen/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../uiscreen/splash_screen.dart';
import '../uiscreen/support_ticket_form.dart';

class RouteHelper {

  ///File path
  static const String splashScreen = "/front-page";
  static const String loginScreen = "/login-page";
  static const String dashboardScreen = "/dashboard-page";
  static const String addSupportTicketScreen = "/add-support-ticket-page";
  static const String supportTicketFormScreen = "/support-ticket-form-page";
  static const String detailScreen = "/detail-page";


  ///Getter of file path
  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getDashboardScreen() => dashboardScreen;
  static String getAddSupportTicketsScreen() => addSupportTicketScreen;
  static String getSupportTicketsFormScreen() => supportTicketFormScreen;
  static String getDetailScreen() => detailScreen;



  ///File path initialization
  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: addSupportTicketScreen, page: () => AddQuickSupportTicketsScreen()),
    GetPage(name: supportTicketFormScreen, page: () => SupportTicketFormScreen()),
    GetPage(name: detailScreen, page: () => DetailScreen()),

  ];
}