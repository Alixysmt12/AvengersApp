import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/controller.dart';
import '../routes/route_helper.dart';
import '../theme/color_constants.dart';
import '../utils/clearing_shared_preference.dart';
import '../widgets/custom_app_bar_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String? userId;
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pop(context); // Navigate to the previous screen
        },
        onNotificationPressed: () {
          // Handle notification icon press
          // Get.back();
        },
        onLogoutPressed: () {
          QuickAlert.show(
            confirmBtnText: "Yes, Logout!",
            context: context,
            type: QuickAlertType.error,
            title: 'Are You Sure?',
            text: 'You will be logged out of the system!',
            onConfirmBtnTap: () {
              clearSharedPreferences();
              Get.offNamed(RouteHelper.getLoginScreen());
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteHelper.getLoginScreen(),
                    (Route<dynamic> route) => false,
              );
            },
          );
        }, titleText: 'Project Wise Open \n Tickets',
      ),
      body: GetBuilder<GetNotificationController>(
          builder: (data) {
            return data.isLoading ? ListView.builder(
              itemCount: (data.getList.isNotEmpty && data.getList[0].data != null)
                  ? data.getList[0].data!.length
                  : 0,
              itemBuilder: (context, index) {

                var dataList = data.getList[0].data![index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 13),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorConstants.dashboardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorConstants.accentColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Green check icon
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 12), // Space between icon and text

                        // Ticket details (Expanded moved here)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(color: Colors.black, fontSize: 16),
                                  children: [
                                    const TextSpan(text: "Ticket ID: "),
                                    TextSpan(
                                      text: dataList.recordId ?? "",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const TextSpan(text: "    Project: "),
                                    TextSpan(
                                      text: dataList.projectName ?? "",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4), // Space between text lines
                              Text(
                                dataList.title ?? "",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );

              },
            ) : SizedBox(
              width: MediaQuery.of(context)
                  .size
                  .width, // Set width to the screen width
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  child: SpinKitSpinningLines(
                    color: ColorConstants.accentColor,
                    size: 50.0,
                  ),
                  /*CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ),*/
                ),
              ),
            );
          }
      ),
    );
  }
  Future<void> getData() async {
    Get.find<GetNotificationController>().resetState();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id');
    Get.find<GetNotificationController>().getData(userId ?? "");
  }
}
