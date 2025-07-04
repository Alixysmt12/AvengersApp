import 'package:avengers_app/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/controller.dart';
import '../routes/route_helper.dart';
import '../utils/clearing_shared_preference.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/edit_text_widget.dart';
import '../widgets/new_spinner_widget.dart';
import '../widgets/show_custom_snackbar.dart';

class AddQuickSupportTicketsScreen extends StatefulWidget {
  const AddQuickSupportTicketsScreen({super.key});

  @override
  State<AddQuickSupportTicketsScreen> createState() =>
      _AddQuickSupportTicketsScreenState();
}

class _AddQuickSupportTicketsScreenState
    extends State<AddQuickSupportTicketsScreen> {
  bool yearCheck = false;
  bool moduleCheck = false;
  bool userCheck = false;
  bool issueDetailCheck = false;

  List<ProjectName> dropDownYear = [];
  String selectedValueProject = "Select";
  String selectedProjectId = "";
  String selectedValueModule = "Select";
  String selectedModuleId = "";
  String? userId;
  List<ModuleName> dropDownModule = [];

  @override
  void initState() {
    super.initState();
    getLovs();
  }

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _issueDetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onBackPressed: () {
            Navigator.pop(context); // Navigate to the previous screen
          },
          onNotificationPressed: () {
            // Handle notification icon press
            Get.toNamed(RouteHelper.getNotificationScreen());
          },
          onLogoutPressed: () {
            // Handle logout icon press
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
          },
          titleText: 'Quick Support Ticket \n Form',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 13),
            child: GetBuilder<GetLOVSController>(builder: (lovsData) {
              return lovsData.isLoading
                  ? Column(
                      children: [
                        MyCustomDropdownWidget<ProjectName>(
                          isError: yearCheck,
                          title: 'Project Name*',
                          items: dropDownYear,
                          selectedItem: dropDownYear.isNotEmpty
                              ? dropDownYear.first
                              : null,
                          itemToString: (ProjectName year) => year.string,
                          onChanged: (ProjectName? value) {
                            setState(() {
                              selectedValueProject = value?.string ?? "";
                              selectedProjectId = value?.id ?? "";
                              getModule(selectedProjectId);
                            });
                          },
                        ),
                        MyCustomDropdownWidget<ModuleName>(
                          isError: moduleCheck,
                          title: 'Template*',
                          items: dropDownModule,
                          selectedItem: dropDownModule.isNotEmpty ? dropDownModule.first : null,
                          itemToString: (ModuleName year) => year.string,
                          onChanged: (ModuleName? value) {
                            setState(() {
                              selectedValueModule = value?.string ?? "";
                              selectedModuleId = value?.string ?? "";
                            });
                          },

                        ),

                        EditTextWidget(
                          controller: _userController,
                          hintText: "User Credentials*",
                          icon: Icons.mail_outline,
                          isError: userCheck,
                        ),
                        EditTextWidget(
                          controller: _issueDetailController,
                          hintText: "Issue Details*",
                          icon: Icons.mail_outline,
                          isError: issueDetailCheck,
                          maxLength: 255,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context)
                                .size
                                .width, // Full width of the screen
                            height: 50, // Height of the button
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              // Same border radius as button
                              gradient: LinearGradient(
                                colors: [
                                  ColorConstants.primaryColor,
                                  ColorConstants.accentColor
                                ], // Example gradient colors
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: LoadingButton(
                              height: 50,
                              borderRadius: 8,
                              animate: true,
                              color: Colors.transparent,
                              // Make button color transparent
                              width: MediaQuery.of(context).size.width,
                              loader: Container(
                                padding: const EdgeInsets.all(10),
                                width: 40,
                                height: 40,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onTap: (startLoading, stopLoading,
                                  buttonState) async {

                                if (_userController.text.isEmpty || _issueDetailController.text.isEmpty ||
                                   selectedProjectId == ""|| selectedModuleId == "") {
                                  setState(() {
                                    yearCheck = checkSelection(
                                        selectedValueProject);
                                    moduleCheck = checkSelection(
                                        selectedValueModule);
                                    userCheck = _userController.text.isEmpty;
                                    issueDetailCheck = _issueDetailController.text.isEmpty;
                                  });

                                  showCustomSnackBar("Please Fill Required Fields.");

                                }
                                else{
                                  if (buttonState == ButtonState.idle) {
                                    startLoading();

                                  }

                                  var authController = Get.find<AddQuickSupportController>();
                                  authController
                                      .addQuickSupport(
                                    userId ?? "",
                                    selectedProjectId,
                                    _userController.text.toString(),
                                    selectedModuleId,
                                    _issueDetailController.text.toString(),
                                  )
                                      .then((response) async {
                                    if (response.status == true) {
                                      stopLoading();
                                      Get.offNamed(RouteHelper.getDashboardScreen());

                                    } else {
                                      stopLoading();
                                      showCustomSnackBar(response.message.toString(),
                                          title: "Error");
                                    }
                                  });
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.2),
                        child: Center(
                          child: Container(
                            child: SpinKitSpinningLines(
                              color: ColorConstants.accentColor,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ),
                    );
            }),
          ),
        ));
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

      List<ProjectName> getName = [];
      for (int i = 0; i < projectNameLength; i++) {
        getName.add(ProjectName(
          lovs.getList[0].data!.projects![i].recordId!,
          lovs.getList[0].data!.projects![i].projectName!,
        ));
      }
      dropDownYear = getName;
    }
  }

  Future<void> getModule(String projectId) async {
    await Get.find<GetProjectCategoryController>().getData(userId ?? "",projectId);
    var makeController = Get.find<GetProjectCategoryController>();

    if (makeController.getList.isNotEmpty &&
        makeController.getList[0].data != null) {
      int length = makeController.getList[0].data!.length;

      List<ModuleName> module = [];
      for (int i = 0; i < length; i++) {
        module.add(ModuleName(
          makeController.getList[0].data![i].title!,
        ));
      }

      dropDownModule = module;
    }

    setState(() {});
  }

  bool checkSelection(String select) {
    return select.toLowerCase() == "select";
  }

}

class ProjectName {
  final String id;
  final String string;

  ProjectName(this.id, this.string);
}
class ModuleName {
  final String string;

  ModuleName(this.string);
}
