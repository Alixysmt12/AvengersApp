import 'package:avengers_app/routes/route_helper.dart';
import 'package:avengers_app/theme/app_theme.dart';
import 'package:avengers_app/theme/theme_controller.dart';
import 'package:avengers_app/utils/color_theme.dart';
import 'package:avengers_app/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: 'Professional Theme Setup',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.theme, // Uses the GetX theme controller
      initialRoute: RouteHelper.getDashboardScreen(),
      getPages: RouteHelper.routes,
    ));
  }
}
