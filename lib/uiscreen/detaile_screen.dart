import 'package:flutter/material.dart';

import '../theme/color_constants.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/tickets_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pop(context); // Navigate to the previous screen
        },
        onNotificationPressed: () {
          // Handle notification icon press
          print('Notification pressed');
        },
        onLogoutPressed: () {
          // Handle logout icon press
          print('Logout pressed');
        }, titleText: 'Project Wise Open \n Tickets',
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 13),
        child: ReusableDashboardTile(
          gradientColors: [ColorConstants.dashboardColor12, ColorConstants.dashboardColor12],
          iconPath: 'assets/images/icon5.png',
          title: 'All Open',
          count: '00',
        ),
      ),
    );

  }
}
