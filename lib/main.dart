import 'package:avengers_app/routes/route_helper.dart';
import 'package:avengers_app/theme/app_theme.dart';
import 'package:avengers_app/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dependencies/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

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

