import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/controller.dart';
import '../routes/route_helper.dart';
import '../theme/color_constants.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/edit_text_widget.dart';
import '../widgets/new_spinner_widget.dart';

class SupportTicketFormScreen extends StatefulWidget {
  const SupportTicketFormScreen({super.key});

  @override
  State<SupportTicketFormScreen> createState() => _SupportTicketFormScreenState();
}

class _SupportTicketFormScreenState extends State<SupportTicketFormScreen> {

  bool yearCheck = false;
  List<ProjectName> dropDownYear = [];
  String selectedValueYear = "Select";
  String selectedYearId = "0";
  String? userId;
  @override
  void initState() {
    super.initState();
    getLovs();
  }

  final TextEditingController _emailController = TextEditingController();

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
          }, titleText: 'Support Ticket \n Form',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 13),
            child: GetBuilder<GetLOVSController>(
              builder: (lovsData) {
                return lovsData.isLoading ? Column(
                  children: [
                    MyCustomDropdownWidget<ProjectName>(
                      isError: yearCheck,
                      title: 'Project Name*',
                      items: dropDownYear,
                      selectedItem: dropDownYear.isNotEmpty ? dropDownYear.first : null,
                      itemToString: (ProjectName year) => year.string,
                      onChanged: (ProjectName? value) {
                        setState(() {
                          selectedValueYear = value?.string ?? "";
                          selectedYearId = value?.id ?? "";
                          // getMake(selectedYearId);
                          // Handle selection change
                        });
                      },

                    ),
                    MyCustomDropdownWidget<ProjectName>(
                      isError: yearCheck,
                      title: 'Project Name*',
                      items: dropDownYear,
                      selectedItem: dropDownYear.isNotEmpty ? dropDownYear.first : null,
                      itemToString: (ProjectName year) => year.string,
                      onChanged: (ProjectName? value) {
                        setState(() {
                          selectedValueYear = value?.string ?? "";
                          selectedYearId = value?.id ?? "";
                          // getMake(selectedYearId);
                          // Handle selection change
                        });
                      },

                    ),

                    EditTextWidget(
                      controller: _emailController,
                      hintText: "Module",
                      icon: Icons.mail_outline,
                    ),
                    EditTextWidget(
                      controller: _emailController,
                      hintText: "Screen Name",
                      icon: Icons.mail_outline,
                    ),
                    EditTextWidget(
                      controller: _emailController,
                      hintText: "Complaint channel",
                      icon: Icons.mail_outline,
                    ),
                    EditTextWidget(
                      controller: _emailController,
                      hintText: "Tickets Category",
                      icon: Icons.mail_outline,
                    ),
                    EditTextWidget(
                      controller: _emailController,
                      hintText: "Interface",
                      icon: Icons.mail_outline,
                    ),
                    EditTextWidget(
                      controller: _emailController,
                      hintText: "User",
                      icon: Icons.mail_outline,
                    ),

                    SizedBox(height: 50,),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width, // Full width of the screen
                        height: 50, // Height of the button
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), // Same border radius as button
                          gradient: LinearGradient(
                            colors: [ColorConstants.primaryColor, ColorConstants.accentColor], // Example gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: LoadingButton(
                          height: 50,
                          borderRadius: 8,
                          animate: true,
                          color: Colors.transparent, // Make button color transparent
                          width: MediaQuery.of(context).size.width,
                          loader: Container(
                            padding: const EdgeInsets.all(10),
                            width: 40,
                            height: 40,
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: (startLoading, stopLoading, buttonState) async {
                            if (buttonState == ButtonState.idle) {
                              startLoading();
                              // Simulate a delay or API call
                              await Future.delayed(const Duration(seconds: 5));
                              stopLoading();
                              Get.offNamed(RouteHelper.getDashboardScreen());
                            }
                          },
                        ),
                      ),
                    )

                  ],
                ) : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom:
                        MediaQuery.of(context).size.height * 0.2),
                    child: Center(
                      child: Container(
                        child: SpinKitSquareCircle(
                          color: ColorConstants.accentColor,
                          size: 50.0,
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        )
    );
  }
  Future<void> getLovs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userId = prefs.getString('user_id');
    Get.find<GetLOVSController>().resetState(); // Reset the state

    await Get.find<GetLOVSController>().getData(userId ?? "");
    var lovs = Get.find<GetLOVSController>();
    if (lovs.getList.isNotEmpty &&
        lovs.getList[0].data != null &&
        lovs.getList[0].data!.projects != null) {

      int projectNameLength = lovs.getList[0].data!.projects!.length;

      List<ProjectName> _getName = [];
      for (int i = 0; i < projectNameLength; i++) {
        _getName.add(ProjectName(
          lovs.getList[0].data!.projects![i].recordId!,
          lovs.getList[0].data!.projects![i].projectName!,
        ));
      }
      dropDownYear = _getName;
    }
  }
}
class ProjectName {
  final String id;
  final String string;

  ProjectName(this.id, this.string);
}