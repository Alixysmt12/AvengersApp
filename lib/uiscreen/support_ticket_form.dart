import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import '../network/controller.dart';
import '../routes/route_helper.dart';
import '../theme/color_constants.dart';
import '../utils/clearing_shared_preference.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/edit_text_widget.dart';
import '../widgets/new_spinner_widget.dart';
import '../widgets/show_custom_snackbar.dart';

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
  bool ticketSummaryCheck = false;
  bool ticketDetailCheck = false;
  bool interfaceCheck = false;
  bool complaintChannelCheck = false;
  List<ProjectName> dropDownYear = [];
  List<ModuleName> dropDownModule = [];
  List<ScreenName> dropDownScreen = [];
  List<TicketCategory> dropDownTicketCat = [];
  List<UserData> dropDownUser = [];
  List<Interface> dropDownInterface = [];
  List<ComplaintChannel> dropDownComplaintChannel = [];

  String selectedValueProject = "Select";
  String selectedProjectId = "";
  String selectedValueModule = "Select";
  String selectedModuleId = "";
  String selectedValueScreen = "Select";
  String selectedScreenId = "";
  String selectedValueTicketCat = "Select";
  String selectedTicketCatId = "";
  String selectedValueUser = "Select";
  String selectedUserId = "";
  String selectedValueInterface = "Select";
  String selectedInterfaceId = "";
  String selectedValueComplaintChannel = "Select";
  String selectedComplaintChannelId = "";

  final picker = ImagePicker();
  List<File> selectedImages = [];
  List<String> sellImagesProfile = [];


  String? userId;
  @override
  void initState() {
    super.initState();
    getLovs();
  }

  final TextEditingController _ticketSummaryController = TextEditingController();
  final TextEditingController _ticketsDetailController = TextEditingController();

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
                    MyCustomDropdownWidget<ComplaintChannel>(
                      isError: complaintChannelCheck,
                      title: 'Complaint channel*',
                      items: dropDownComplaintChannel,
                      selectedItem: dropDownComplaintChannel.isNotEmpty ? dropDownComplaintChannel.first : null,
                      itemToString: (ComplaintChannel year) => year.string,
                      onChanged: (ComplaintChannel? value) {
                        setState(() {
                          selectedValueComplaintChannel = value?.string ?? "";
                          selectedComplaintChannelId = value?.string ?? "";
                        });
                      },

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
                    MyCustomDropdownWidget<Interface>(
                      isError: interfaceCheck,
                      title: 'Interface*',
                      items: dropDownInterface,
                      selectedItem: dropDownInterface.isNotEmpty ? dropDownInterface.first : null,
                      itemToString: (Interface year) => year.string,
                      onChanged: (Interface? value) {
                        setState(() {
                          selectedValueInterface = value?.string ?? "";
                          selectedInterfaceId = value?.string ?? "";
                        });
                      },

                    ),
                    MyCustomDropdownWidget<UserData>(
                      isError: ticketSummaryCheck,
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

                    EditTextWidget(
                      controller: _ticketSummaryController,
                      hintText: "Tickets Summary",
                      icon: Icons.mail_outline,
                      isError: ticketSummaryCheck,
                    ),
                    EditTextWidget(
                      controller: _ticketsDetailController,
                      hintText: "Tickets Details*",
                      icon: Icons.mail_outline,
                      isError: ticketDetailCheck,
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
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () {

                        if(selectedImages.length < 2){
                          getImages();
                        }else{
                          showCustomSnackBar("You can only select 2 images.");
                        }

                      },
                      child: Icon(
                        Icons.add_box,
                        color: ColorConstants.accentColor,
                        size: 52,
                      ),
                    ),
                    SizedBox(height: 5,),
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

                            if (_ticketSummaryController.text.isEmpty || _ticketsDetailController.text.isEmpty || selectedProjectId == ""|| selectedModuleId == "" || selectedScreenId == ""|| selectedComplaintChannelId == ""|| selectedTicketCatId == ""|| selectedInterfaceId == ""|| selectedInterfaceId == "") {
                              setState(() {
                                yearCheck = checkSelection(selectedValueProject);
                                moduleCheck = checkSelection(selectedValueModule);
                                screenCheck = checkSelection(selectedValueScreen);
                                complaintChannelCheck = checkSelection(selectedValueComplaintChannel);
                                ticketCheck = checkSelection(selectedValueTicketCat);
                                interfaceCheck = checkSelection(selectedValueInterface);
                                ticketSummaryCheck = _ticketSummaryController.text.isEmpty;
                                ticketDetailCheck = _ticketsDetailController.text.isEmpty;
                              });

                              showCustomSnackBar("Please Fill Required Fields.");

                            }
                            else{

                              String image1 = sellImagesProfile.isNotEmpty ? sellImagesProfile[0] : "";
                              String image2 = sellImagesProfile.length > 1 ? sellImagesProfile[1] : "";


                              if (buttonState == ButtonState.idle) {
                                startLoading();
                              }

                              if (selectedImages.isNotEmpty) {
                                {
                                  convertImagesToBase64Profile(selectedImages);
                                }
                              }

                              var authController = Get.find<AddTicketsController>();
                              authController
                                  .addQuickSupport(
                                userId ?? "",
                                selectedProjectId,
                                selectedComplaintChannelId,
                                selectedTicketCatId,
                                selectedInterfaceId,
                                selectedModuleId,
                                _ticketSummaryController.text.toString(),
                                  _ticketsDetailController.text.toString(),
                                selectedTicketCatId,
                                "yes",
                                  image1,image2
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
                ) : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom:
                        MediaQuery.of(context).size.height * 0.2),
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

      int ticketCatLength = lovs.getList[0].data!.category!.length;

      List<TicketCategory> _getTicket = [];
      for (int i = 0; i < ticketCatLength; i++) {
        _getTicket.add(TicketCategory(
          lovs.getList[0].data!.category![i].recordId!,
          lovs.getList[0].data!.category![i].issueCategory!,
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

      int interfaceLength = lovs.getList[0].data!.interface!.length;
      List<Interface> _getInterface = [];
      for (int i = 0; i < interfaceLength; i++) {
        _getInterface.add(Interface(
          lovs.getList[0].data!.interface![i].value !,
        ));
      }
      dropDownInterface = _getInterface;

      int compChanLength = lovs.getList[0].data!.complaintChannel!.length;
      List<ComplaintChannel> _getComplaintChannel = [];
      for (int i = 0; i < compChanLength; i++) {
        _getComplaintChannel.add(ComplaintChannel(
          lovs.getList[0].data!.complaintChannel![i].value !,
        ));
      }
      dropDownComplaintChannel = _getComplaintChannel;
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

  bool checkSelection(String select) {
    return select.toLowerCase() == "select";
  }
  Future<void> getImages() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      final pickedFile = await picker.pickMultiImage(
          imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
      if (pickedFile != null && pickedFile.isNotEmpty) {
        setState(() {
          selectedImages.addAll(pickedFile.map((xfile) => File(xfile.path)));
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No images selected.')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permission denied to access photos.')));
    }
  }


  void convertImagesToBase64Profile(List<File> imageFiles) {
    sellImagesProfile.clear(); // Clear previous images if any

    imageFiles.forEach((imageFile) {
      try {
        List<int> imageBytes = imageFile.readAsBytesSync();
        String base64Image = "data:image/png;base64,${base64Encode(imageBytes)}";
        sellImagesProfile.add(base64Image);
      } catch (e) {
        print('Error: $e');
      }
    });
  }
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

class Interface {
  final String string;

  Interface(this.string);
}
class ComplaintChannel {
  final String string;

  ComplaintChannel(this.string);
}