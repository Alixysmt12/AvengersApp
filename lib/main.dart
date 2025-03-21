import 'package:avengers_app/routes/route_helper.dart';
import 'package:avengers_app/theme/app_theme.dart';
import 'package:avengers_app/theme/theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dependencies/dependencies.dart' as dep;
import 'fcm/firebase_api.dart';

Future<void> requestNotificationPermission() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.denied) {
    print("Notifications permission denied!");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

  await Firebase.initializeApp();  // Initialize Firebase first
  await dep.init();

  await requestNotificationPermission();  //Now it's safe to call this
  await FirebaseApi().initNotifications();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString("user_id");

  runApp(MyApp(userId: userId));
}

class MyApp extends StatelessWidget {
  final String? userId;
  final ThemeController themeController = Get.put(ThemeController());

  MyApp({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: 'Professional Theme Setup',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.theme,
      initialRoute: userId == null
          ? RouteHelper.getLoginScreen()
          : RouteHelper.getDashboardScreen(),
      getPages: RouteHelper.routes,
    ));
  }
}

