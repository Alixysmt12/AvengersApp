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
import '../widgets/tickets_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  String? userId;
  String? projectWiseTickets;
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
          Get.back();
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

      body: GetBuilder<ProjectWiseListingController>(
        builder: (data) {
          return data.isLoading ? ListView.builder(
            itemCount: (data.getList.isNotEmpty && data.getList[0].data != null)
                ? data.getList[0].data!.length
                : 0,
            itemBuilder: (context, index) {

              var dataList = data.getList[0].data![index];
              return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 13),
              child: ReusableDashboardTile(
              gradientColors: [ColorConstants.dashboardColor12, ColorConstants.dashboardColor12],
              iconPath: 'assets/images/icon12.png',
              title: dataList.name ?? "-",
              count: dataList.count ?? "-",
                textColor: ColorConstants.primaryDarkColor,
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

  /*Padding(
  padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 13),
  child: ReusableDashboardTile(
  gradientColors: [ColorConstants.dashboardColor12, ColorConstants.dashboardColor12],
  iconPath: 'assets/images/icon12.png',
  title: 'All Open',
  count: '00',
  ),
  ),*/

  Future<void> getData() async {
    Get.find<ProjectWiseListingController>().resetState();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the passed arguments
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey("listing")) {
      projectWiseTickets = args["listing"];
    }
    userId = prefs.getString('user_id');
    Get.find<ProjectWiseListingController>().getData(userId ?? "", projectWiseTickets ?? "");
  }
}
