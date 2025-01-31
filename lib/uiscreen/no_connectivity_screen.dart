import 'package:avengers_app/network/controller.dart';
import 'package:avengers_app/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NoConnectivityScreen extends StatefulWidget {
  const NoConnectivityScreen({super.key});

  @override
  State<NoConnectivityScreen> createState() => _NoConnectivityScreenState();
}

class _NoConnectivityScreenState extends State<NoConnectivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: Colors.white, // Set background color if needed
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/images/noconnection.json',
              repeat: true,
            ),
          ),
          const SizedBox(height: 15,),
          const Center(
            child: Text(
              'Something went wrong...',
              style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: Text(
              'An alien is probably blocking your signal.',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade800),
            ),
          ),

          const SizedBox(height: 60,),
          OutlinedButton(
            onPressed: () {
              getData();
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: ColorConstants.primaryColor), // Border color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0), // Radius
              ),
              minimumSize: Size(350, 50), // Size (width, height)
            ),
            child: const Text(
              'Retry',
              style: TextStyle(
                color: ColorConstants.primaryColor, fontWeight: FontWeight.bold// Text color
              ),
            ),
          )

        ],
      ),
    );
  }

  Future<void> getData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var userId = prefs.getString('user_id');
    Get.find<DashboardController>().getData(userId ?? "");
  }

}
