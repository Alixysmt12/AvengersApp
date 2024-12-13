import 'package:avengers_app/theme/color_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/tickets_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Fixed part (top row) with "Hello, Tariq Khuwaja"
              SliverAppBar(
                surfaceTintColor: Colors.white,
                expandedHeight: 100.0,
                backgroundColor: Colors.white,
                floating: false,
                pinned: true, // Keeps the app bar pinned
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // Aligns content at the bottom
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello,',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorConstants.textPrimary,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Tariq Khuwaja',
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/notification.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  onPressed: () {
                                    // Handle notification icon press
                                  },
                                ),
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/logout.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  onPressed: () {
                                    // Handle logout icon press
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Scrollable part starts here
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // First container (larger)
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.primaryColor,
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/icon1.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Pending at Support',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '00',
                                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                          color: ColorConstants.textLight,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            // Second container (smaller)
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.dashboardColor,
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/icon2.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Pending at QA',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: ColorConstants.primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '00',
                                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                          color: ColorConstants.primaryColor,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // Second container (smaller)
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.dashboardColor,
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/icon3.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Pending at Dev',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: ColorConstants.primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '00',
                                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                          color: ColorConstants.primaryColor,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            // First container (larger)
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.primaryColor,
                                  borderRadius: BorderRadius.circular(19),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/icon4.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Pending at Power App',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '00',
                                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                          color: ColorConstants.textLight,
                                          fontSize: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Tickets Highlights',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorConstants.textPrimary,
                          ),
                        ),
                        SizedBox(height: 10),
                        ReusableDashboardTile(
                          gradientColors: [ColorConstants.dashboardColor2, ColorConstants.dashboardColor3],
                          iconPath: 'assets/images/icon5.png',
                          title: 'All Open',
                          count: '00',
                        ),
                        ReusableDashboardTile(
                          gradientColors: [ColorConstants.dashboardColor4, ColorConstants.dashboardColor5],
                          iconPath: 'assets/images/icon6.png',
                          title: 'Quick Support',
                          count: '00',
                        ),
                        ReusableDashboardTile(
                          gradientColors: [ColorConstants.dashboardColor6, ColorConstants.dashboardColor7],
                          iconPath: 'assets/images/icon7.png',
                          title: 'Due Today',
                          count: '00',
                        ),
                        ReusableDashboardTile(
                          gradientColors: [ColorConstants.dashboardColor8, ColorConstants.dashboardColor9],
                          iconPath: 'assets/images/icon7.png',
                          title: 'Timeline Required',
                          count: '00',
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Tickets Close Ratio',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorConstants.textPrimary,
                          ),
                        ),

                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

/*
CustomStatusRow(
icon1Path: 'assets/images/icon1.png',
title1: 'Pending at Support',
count1: '10',
backgroundColor1: Colors.blueAccent,
textColor1: Colors.white,
icon2Path: 'assets/images/icon2.png',
title2: 'Pending at QA',
count2: '5',
backgroundColor2: Colors.orangeAccent,
textColor2: Colors.white,
),*/

/*import 'package:flutter/material.dart';

class CustomStatusRow extends StatelessWidget {
  final String icon1Path;
  final String title1;
  final String count1;
  final Color backgroundColor1;
  final Color textColor1;

  final String icon2Path;
  final String title2;
  final String count2;
  final Color backgroundColor2;
  final Color textColor2;

  const CustomStatusRow({
    Key? key,
    required this.icon1Path,
    required this.title1,
    required this.count1,
    required this.backgroundColor1,
    required this.textColor1,
    required this.icon2Path,
    required this.title2,
    required this.count2,
    required this.backgroundColor2,
    required this.textColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First container (larger)
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(19),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    icon1Path,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    count1,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: textColor1,
                          fontSize: 40,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 15), // Space between the two containers

        // Second container (smaller)
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(19),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    icon2Path,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title2,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: textColor2,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    count2,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: textColor2,
                          fontSize: 40,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/