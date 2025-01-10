import 'package:avengers_app/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';
import '../widgets/tickets_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          backgroundColor: ColorConstants.primaryColor, // Custom primary color
          activeIcon: Icons.close,
          spacing: 10,
          spaceBetweenChildren: 10,
          children: [
            SpeedDialChild(
              child: Icon(Icons.support_agent, color: Colors.white),
              backgroundColor: ColorConstants.primaryColor,
              label: 'Add Quick Support Ticket',
              labelStyle: TextStyle(fontSize: 16.0),
              onTap: () {
                // Handle 'Add Quick Support Ticket' tap
                Get.offNamed(RouteHelper.getAddSupportTicketsScreen());
                // Navigate or perform desired action
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.note_add, color: Colors.white),
              backgroundColor: ColorConstants.primaryColor,
              label: 'Add Support Ticket',
              labelStyle: TextStyle(fontSize: 16.0),
              onTap: () {
                // Handle 'Add Support Ticket' tap
                Get.offNamed(RouteHelper.getSupportTicketsFormScreen());
                // Navigate or perform desired action
              },
            ),
          ],
        ),
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
                                height: 150,
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
                                height: 150,
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
                                height: 150,
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
                                height: 150,
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
                        SizedBox(height: 10,),

                        Row(
                          children: [
                            CircularProgressBarWithLabel(),
                            SizedBox(width: 15,),
                            CircularProgressBarWithLabel2(),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Average Ticket Closure Time',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorConstants.textPrimary,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            // First container (larger)
                            Expanded(
                              flex: 3,
                              child: Container(
                                height: 150,
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
                              flex: 3,
                              child: Container(
                                height: 150,
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
                                        'assets/images/icon11.png',
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
                          ],
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

class CircularProgressBarWithLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'MTD',  // Label
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold
              )
          ),
          CustomPaint(
            size: Size(140, 100),  // Adjust the size of the progress bar
            painter: CircularProgressBarPainter(progress: 0.72), // 72% progress
          ),
        ],
      ),
    );
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double progress; // Progress value (0.0 to 1.0)
  CircularProgressBarPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the background circle (gray)
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2) // Gray background
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20; // Increased stroke width

    // Paint for the progress arc (with gradient)
    Paint progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20; // Increased stroke width
    progressPaint.shader = SweepGradient(
      startAngle: 3.14,  // Starting angle
      endAngle: 3.14 + 3.14 * progress,  // Adjust the sweep based on progress
      colors: [ColorConstants.dashboardColor2, ColorConstants.dashboardColor3],  // Gradient colors
    ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2));

    // Draw the background arc (half circle)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14,  // Starting angle (left side of half circle)
      3.14,  // Sweep angle (half circle)
      false,  // Do not use the center of the circle
      backgroundPaint,
    );

    // Draw the progress arc (half circle with gradient)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14,  // Starting angle
      3.14 * progress,  // Sweep angle based on progress
      false,  // Do not use the center of the circle
      progressPaint,
    );

    // Draw the percentage text at the bottom center
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${(progress * 100).toInt()}%',  // Display percentage
        style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    // Adjust text position to the bottom center
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, size.height - textPainter.height - 10), // Bottom-center position
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircularProgressBarWithLabel2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'YTD',  // Label
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold
              )
          ),
          CustomPaint(
            size: Size(140, 100),  // Adjust the size of the progress bar
            painter: CircularProgressBarPainter(progress: 0.22), // 72% progress
          ),
        ],
      ),
    );
  }
}

class CircularProgressBarPainter2 extends CustomPainter {
  final double progress; // Progress value (0.0 to 1.0)
  CircularProgressBarPainter2({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the background circle (gray)
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2) // Gray background
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20; // Increased stroke width

    // Paint for the progress arc (with gradient)
    Paint progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20; // Increased stroke width
    progressPaint.shader = SweepGradient(
      startAngle: 3.14,  // Starting angle
      endAngle: 3.14 + 3.14 * progress,  // Adjust the sweep based on progress
      colors: [ColorConstants.dashboardColor8, ColorConstants.dashboardColor9],  // Gradient colors
    ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2));

    // Draw the background arc (half circle)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14,  // Starting angle (left side of half circle)
      3.14,  // Sweep angle (half circle)
      false,  // Do not use the center of the circle
      backgroundPaint,
    );

    // Draw the progress arc (half circle with gradient)
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14,  // Starting angle
      3.14 * progress,  // Sweep angle based on progress
      false,  // Do not use the center of the circle
      progressPaint,
    );

    // Draw the percentage text at the bottom center
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${(progress * 100).toInt()}%',  // Display percentage
        style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    // Adjust text position to the bottom center
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, size.height - textPainter.height - 10), // Bottom-center position
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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