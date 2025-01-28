import 'package:avengers_app/network/controller.dart';
import 'package:avengers_app/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/route_helper.dart';
import '../widgets/tickets_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _key = GlobalKey<ExpandableFabState>();
  String? userId;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          backgroundColor: ColorConstants.primaryColor,
          // Custom primary color
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
                Get.toNamed(RouteHelper.getAddSupportTicketsScreen());
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
                Get.toNamed(RouteHelper.getSupportTicketsFormScreen());
                // Navigate or perform desired action
              },
            ),
          ],
        ),
        body: SafeArea(
          child: GetBuilder<DashboardController>(builder: (dashboardData) {
            return dashboardData.isLoading
                ? SizedBox(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set width to the screen width
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Container(
                        child: SpinKitSquareCircle(
                          color: ColorConstants.accentColor,
                          size: 50.0,
                        ),
                      ),
                    ),
                  )
                : CustomScrollView(
                    slivers: [
                      // Fixed part (top row) with "Hello, Tariq Khuwaja"
                      SliverAppBar(
                        surfaceTintColor: Colors.white,
                        expandedHeight: 100.0,
                        backgroundColor: Colors.white,
                        floating: false,
                        pinned: true,
                        // Keeps the app bar pinned
                        flexibleSpace: FlexibleSpaceBar(
                          background: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              // Aligns content at the bottom
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hello,',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color:
                                                    ColorConstants.textPrimary,
                                              ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          dashboardData
                                                  .getList[0].data!.fullname ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
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
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            RouteHelper.getDetailScreen(),
                                            arguments: {"listing": "pending_at_support"},
                                          );
                                        },
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
                                                  dashboardData.getList[0].data!.counters?.pendingAtSupport ??
                                                      "00",
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
                                    ),
                                    SizedBox(width: 15),
                                    // Second container (smaller)
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            RouteHelper.getDetailScreen(),
                                            arguments: {"listing": "pending_at_qa"},
                                          );
                                        },
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
                                                  dashboardData.getList[0].data!.counters?.pendingAtQa ?? "00",
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
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    // Second container (smaller)
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            RouteHelper.getDetailScreen(),
                                            arguments: {"listing": "pending_at_dev"},
                                          );
                                        },
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
                                                  dashboardData.getList[0].data!.counters?.pendingAtDev ?? "00",
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
                                    ),
                                    SizedBox(width: 15),
                                    // First container (larger)
                                    Expanded(
                                      flex: 3,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            RouteHelper.getDetailScreen(),
                                            arguments: {"listing": "pending_at_powerapp"},
                                          );
                                        },
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
                                                  dashboardData.getList[0].data!.counters?.pendingAtPowerapp ??
                                                      "00",
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
                                    ),
                                  ],
                                ),

                                SizedBox(height: 15),
                                Text(
                                  'Tickets Highlights',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: ColorConstants.textPrimary,
                                      ),
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteHelper.getDetailScreen(),
                                      arguments: {"listing": "all_open"},
                                    );
                                  },
                                  child: ReusableDashboardTile(
                                    gradientColors: [
                                      ColorConstants.dashboardColor2,
                                      ColorConstants.dashboardColor3
                                    ],
                                    iconPath: 'assets/images/icon5.png',
                                    title: 'All Open',
                                    count: dashboardData.getList[0].data!
                                            .ticketHighlights?.allOpen ??
                                        "00",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteHelper.getDetailScreen(),
                                      arguments: {"listing": "quick_support"},
                                    );
                                  },
                                  child: ReusableDashboardTile(
                                    gradientColors: [
                                      ColorConstants.dashboardColor4,
                                      ColorConstants.dashboardColor5
                                    ],
                                    iconPath: 'assets/images/icon6.png',
                                    title: 'Quick Support',
                                    count: dashboardData.getList[0].data!
                                            .ticketHighlights?.quickSupport ??
                                        "00",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteHelper.getDetailScreen(),
                                      arguments: {"listing": "due_today"},
                                    );
                                  },
                                  child: ReusableDashboardTile(
                                    gradientColors: [
                                      ColorConstants.dashboardColor6,
                                      ColorConstants.dashboardColor7
                                    ],
                                    iconPath: 'assets/images/icon7.png',
                                    title: 'Due Today',
                                    count: dashboardData.getList[0].data!
                                            .ticketHighlights?.dueToday ??
                                        "00",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteHelper.getDetailScreen(),
                                      arguments: {"listing": "timeline_required"},
                                    );
                                  },
                                  child: ReusableDashboardTile(
                                    gradientColors: [
                                      ColorConstants.dashboardColor8,
                                      ColorConstants.dashboardColor9
                                    ],
                                    iconPath: 'assets/images/icon7.png',
                                    title: 'Timeline Required',
                                    count: dashboardData.getList[0].data!
                                            .ticketHighlights?.timelineRequired ??
                                        "00",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteHelper.getDetailScreen(),
                                      arguments: {"listing": "over_due"},
                                    );
                                  },
                                  child: ReusableDashboardTile(
                                    gradientColors: [
                                      ColorConstants.dashboardColor10,
                                      ColorConstants.dashboardColor11
                                    ],
                                    iconPath: 'assets/images/icon8.png',
                                    title: 'Overdue',
                                    count: dashboardData.getList[0].data!
                                            .ticketHighlights?.overDue ??
                                        "00",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteHelper.getDetailScreen(),
                                      arguments: {"listing": "over_due"},
                                    );
                                  },
                                  child: ReusableDashboardTile(
                                    gradientColors: [
                                      ColorConstants.dashboardColor2,
                                      ColorConstants.dashboardColor3
                                    ],
                                    iconPath: 'assets/images/icon7.png',
                                    title: 'Un Assign',
                                    count: dashboardData.getList[0].data!
                                            .ticketHighlights?.unAssigned ??
                                        "00",
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Tickets Close Ratio UHF',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: ColorConstants.textPrimary,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CircularProgressBarWithLabel(
                                        progress: double.tryParse(dashboardData
                                                    .getList[0]
                                                    .data!
                                                    .ticketClosureRatioUHF
                                                    ?.mtd ??
                                                "0") ??
                                            0.0),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    CircularProgressBarWithLabel2(
                                        progress: double.tryParse(dashboardData
                                                    .getList[0]
                                                    .data!
                                                    .ticketClosureRatioUHF
                                                    ?.ytd ??
                                                "0") ??
                                            0.0),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Average Ticket Closure Time',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
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
                                          borderRadius:
                                              BorderRadius.circular(19),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(11.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/icon4.png',
                                                width: 40,
                                                height: 40,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Power-App',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                dashboardData
                                                        .getList[0]
                                                        .data!
                                                        .averageTicketClosureTime
                                                        ?.powerApp ??
                                                    "00",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge
                                                    ?.copyWith(
                                                      color: ColorConstants
                                                          .textLight,
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
                                          borderRadius:
                                              BorderRadius.circular(19),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(11.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/icon11.png',
                                                width: 40,
                                                height: 40,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Non Power-App',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                dashboardData
                                                        .getList[0]
                                                        .data!
                                                        .averageTicketClosureTime
                                                        ?.nonPowerApp ??
                                                    "00",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge
                                                    ?.copyWith(
                                                      color: ColorConstants
                                                          .textLight,
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
                  );
          }),
        ),
      ),
    );
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userId = prefs.getString('user_id');
    Get.find<DashboardController>().getData(userId ?? "");
    // Get.find<GetLOVSController>().getData(userId ?? "");
  }
}

class CircularProgressBarWithLabel extends StatelessWidget {
  final double progress;

  CircularProgressBarWithLabel({required this.progress});

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
          Text('MTD', // Label
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          CustomPaint(
            size: Size(140, 100), // Adjust the size of the progress bar
            painter: CircularProgressBarPainter(
                progress: progress / 100), // 72% progress
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
      startAngle: 3.14, // Starting angle
      endAngle: 3.14 + 3.14 * progress, // Adjust the sweep based on progress
      colors: [
        ColorConstants.dashboardColor2,
        ColorConstants.dashboardColor3
      ], // Gradient colors
    ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2));

    // Draw the background arc (half circle)
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14, // Starting angle (left side of half circle)
      3.14, // Sweep angle (half circle)
      false, // Do not use the center of the circle
      backgroundPaint,
    );

    // Draw the progress arc (half circle with gradient)
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14, // Starting angle
      3.14 * progress, // Sweep angle based on progress
      false, // Do not use the center of the circle
      progressPaint,
    );

    // Draw the percentage text at the bottom center
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${(progress * 100).toInt()}%', // Display percentage
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    // Adjust text position to the bottom center
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2,
          size.height - textPainter.height - 10), // Bottom-center position
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircularProgressBarWithLabel2 extends StatelessWidget {
  final double progress;

  CircularProgressBarWithLabel2({required this.progress});

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
          Text('YTD', // Label
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          CustomPaint(
            size: Size(140, 100), // Adjust the size of the progress bar
            painter: CircularProgressBarPainter(
                progress: progress / 100), // 72% progress
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
      startAngle: 3.14, // Starting angle
      endAngle: 3.14 + 3.14 * progress, // Adjust the sweep based on progress
      colors: [
        ColorConstants.dashboardColor8,
        ColorConstants.dashboardColor9
      ], // Gradient colors
    ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2));

    // Draw the background arc (half circle)
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14, // Starting angle (left side of half circle)
      3.14, // Sweep angle (half circle)
      false, // Do not use the center of the circle
      backgroundPaint,
    );

    // Draw the progress arc (half circle with gradient)
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height), radius: size.width / 2),
      3.14, // Starting angle
      3.14 * progress, // Sweep angle based on progress
      false, // Do not use the center of the circle
      progressPaint,
    );

    // Draw the percentage text at the bottom center
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '${(progress * 100).toInt()}%', // Display percentage
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    // Adjust text position to the bottom center
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2,
          size.height - textPainter.height - 10), // Bottom-center position
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
