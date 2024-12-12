import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final ThemeController themeController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}



/*Scaffold(
appBar: AppBar(
title: const Text('Home Screen'),
actions: [
IconButton(
icon: Icon(themeController.isDarkMode.value ? Icons.wb_sunny : Icons.nightlight_round),
onPressed: () => themeController.toggleTheme(),
),
],
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Heading 1', style: Theme.of(context).textTheme.displayLarge),
const SizedBox(height: 10),
Text(
'This is body text styled according to the light and dark theme.',
style: Theme.of(context).textTheme.bodyLarge,
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () {},
child: const Text('Press Me'),
),
],
),
),
)*/
