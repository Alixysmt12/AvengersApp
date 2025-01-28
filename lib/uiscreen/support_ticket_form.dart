import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
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
  bool moduleCheck = false;
  bool screenCheck = false;
  bool ticketCheck = false;
  bool userCheck = false;
  List<ProjectName> dropDownYear = [];
  List<ModuleName> dropDownModule = [];
  List<ScreenName> dropDownScreen = [];
  List<TicketCategory> dropDownTicketCat = [];
  List<UserData> dropDownUser = [];

  String selectedValueProject = "Select";
  String selectedProjectId = "0";
  String selectedValueModule = "Select";
  String selectedModuleId = "0";
  String selectedValueScreen = "Select";
  String selectedScreenId = "0";
  String selectedValueTicketCat = "Select";
  String selectedTicketCatId = "0";
  String selectedValueUser = "Select";
  String selectedUserId = "0";

  // final picker = ImagePicker();
  List<File> selectedImages = [];

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCustomDropdownWidget<ProjectName>(
                      isError: yearCheck,
                      title: 'Project Name*',
                      items: dropDownYear,
                      selectedItem: dropDownYear.isNotEmpty ? dropDownYear.first : null,
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
                      title: 'Module*',
                      items: dropDownModule,
                      selectedItem: dropDownModule.isNotEmpty ? dropDownModule.first : null,
                      itemToString: (ModuleName year) => year.string,
                      onChanged: (ModuleName? value) {
                        setState(() {
                          selectedValueModule = value?.string ?? "";
                          selectedModuleId = value?.id ?? "";
                          getScreen(selectedModuleId);
                        });
                      },

                    ),
                    MyCustomDropdownWidget<ScreenName>(
                      isError: screenCheck,
                      title: 'Screen Name*',
                      items: dropDownScreen,
                      selectedItem: dropDownScreen.isNotEmpty ? dropDownScreen.first : null,
                      itemToString: (ScreenName year) => year.string,
                      onChanged: (ScreenName? value) {
                        setState(() {
                          selectedValueScreen = value?.string ?? "";
                          selectedScreenId = value?.id ?? "";

                        });
                      },

                    ),
                    EditTextWidget(
                      controller: _emailController,
                      hintText: "Complaint channel",
                      icon: Icons.mail_outline,
                    ),

                    MyCustomDropdownWidget<TicketCategory>(
                      isError: ticketCheck,
                      title: 'Tickets Category*',
                      items: dropDownTicketCat,
                      selectedItem: dropDownTicketCat.isNotEmpty ? dropDownTicketCat.first : null,
                      itemToString: (TicketCategory year) => year.string,
                      onChanged: (TicketCategory? value) {
                        setState(() {
                          selectedValueTicketCat = value?.string ?? "";
                          selectedTicketCatId = value?.id ?? "";
                        });
                      },

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

                    MyCustomDropdownWidget<UserData>(
                      isError: userCheck,
                      title: 'User*',
                      items: dropDownUser,
                      selectedItem: dropDownUser.isNotEmpty ? dropDownUser.first : null,
                      itemToString: (UserData year) => year.string,
                      onChanged: (UserData? value) {
                        setState(() {
                          selectedValueUser = value?.string ?? "";
                          selectedUserId = value?.id ?? "";
                        });
                      },

                    ),

                    SizedBox(height: 15,),
                    Text(
                      'Add Attachments:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        color: ColorConstants.primaryColor,fontWeight: FontWeight.bold
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // getImages();
                      },
                      child: Icon(
                        Icons.add_box,
                        color: ColorConstants.accentColor,
                        size: 52,
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: selectedImages.isEmpty
                          ? const Center(child: Text(''))
                          : GridView.builder(
                        shrinkWrap: true,
                        itemCount: selectedImages.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                              child: kIsWeb
                                  ? Image.network(selectedImages[index].path)
                                  : Image.file(selectedImages[index]));
                        },
                      ),
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
        lovs.getList[0].data!.projects != null ) {

      int projectNameLength = lovs.getList[0].data!.projects!.length;

      List<ProjectName> _getName = [];
      for (int i = 0; i < projectNameLength; i++) {
        _getName.add(ProjectName(
          lovs.getList[0].data!.projects![i].recordId ?? "",
          lovs.getList[0].data!.projects![i].projectName!,
        ));
      }
      dropDownYear = _getName;

      int ticketCatLength = lovs.getList[0].data!.ticketCategory!.length;

      List<TicketCategory> _getTicket = [];
      for (int i = 0; i < ticketCatLength; i++) {
        _getTicket.add(TicketCategory(
          lovs.getList[0].data!.ticketCategory![i].recordId!,
          lovs.getList[0].data!.ticketCategory![i].issueCategory!,
        ));
      }
      dropDownTicketCat = _getTicket;

      int userLength = lovs.getList[0].data!.users!.length;

      List<UserData> _getUser = [];
      for (int i = 0; i < userLength; i++) {
        _getUser.add(UserData(
          lovs.getList[0].data!.users![i].userId !,
          lovs.getList[0].data!.users![i].fullName!,
        ));
      }
      dropDownUser = _getUser;
    }
  }
  Future<void> getModule(String projectId) async {
    await Get.find<GetModuleController>().getData(userId ?? "",projectId);
    var makeController = Get.find<GetModuleController>();

    if (makeController.getList.isNotEmpty &&
        makeController.getList[0].data != null) {
      int length = makeController.getList[0].data!.length;

      List<ModuleName> _module = [];
      for (int i = 0; i < length; i++) {
        _module.add(ModuleName(
          makeController.getList[0].data![i].recordId!,
          makeController.getList[0].data![i].moduleName!,
        ));
      }

      dropDownModule = _module;
    }

    setState(() {});
  }

  Future<void> getScreen(String moduleId) async {
    await Get.find<GetScreenController>().getData(userId ?? "",moduleId);
    var controller = Get.find<GetScreenController>();

    if (controller.getList.isNotEmpty &&
        controller.getList[0].data != null) {
      int length = controller.getList[0].data!.length;

      List<ScreenName> _module = [];
      for (int i = 0; i < length; i++) {
        _module.add(ScreenName(
          controller.getList[0].data![i].recordId!,
          controller.getList[0].data![i].screenName!,
        ));
      }

      dropDownScreen = _module;
    }

    setState(() {});
  }

  /*Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
          () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('')));
        }
      },
    );
  }*/
}
class ProjectName {
  final String id;
  final String string;

  ProjectName(this.id, this.string);
}
class ModuleName {
  final String id;
  final String string;

  ModuleName(this.id, this.string);
}
class ScreenName {
  final String id;
  final String string;

  ScreenName(this.id, this.string);
}

class TicketCategory {
  final String id;
  final String string;

  TicketCategory(this.id, this.string);
}
class UserData {
  final String id;
  final String string;

  UserData(this.id, this.string);
}