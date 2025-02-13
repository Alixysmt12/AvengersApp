import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_client.dart';
import '../network/controller.dart';
import '../network/repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);


//    ---------------------------------------------------------
//    ---------------------------------------------------------
///                  API CLIENT
//    ---------------------------------------------------------
//    ---------------------------------------------------------


  String? token = sharedPreferences.getString("token");
  if (token != null) {
    Get.lazyPut(
            () => ApiClient(appBaseURL: AppConstants.BASE_URL, token: token));
  } else {
    Get.lazyPut(() => ApiClient(appBaseURL: AppConstants.BASE_URL));
  }

//    ---------------------------------------------------------
//    ---------------------------------------------------------
///                  REPOSITORIES
//    ---------------------------------------------------------
//    ---------------------------------------------------------


  Get.lazyPut(() => LoginRep(apiClient: Get.find()));
  Get.lazyPut(() => DashboardRep(apiClient: Get.find()));
  Get.lazyPut(() => ProjectWiseListingRepo(apiClient: Get.find()));
  Get.lazyPut(() => GetLOVSRepo(apiClient: Get.find()));
  Get.lazyPut(() => GetModuleRepo(apiClient: Get.find()));
  Get.lazyPut(() => GetScreenRepo(apiClient: Get.find()));
  Get.lazyPut(() => GetProjectScreenRepo(apiClient: Get.find()));
  Get.lazyPut(() => AddQuickSupportRepo(apiClient: Get.find()));
  Get.lazyPut(() => AddSupportTicketsRepo(apiClient: Get.find()));
  Get.lazyPut(() => GetNotificationRepo(apiClient: Get.find()));


//    ---------------------------------------------------------
//    ---------------------------------------------------------
///                  CONTROLLER
//    ---------------------------------------------------------
//    ---------------------------------------------------------

  Get.lazyPut(() => LoginController(loginRep: Get.find()));
  Get.lazyPut(() => DashboardController(repo: Get.find()));
  Get.lazyPut(() => ProjectWiseListingController(repo: Get.find()));
  Get.lazyPut(() => GetLOVSController(repo: Get.find()));
  Get.lazyPut(() => GetModuleController(repo: Get.find()));
  Get.lazyPut(() => GetScreenController(repo: Get.find()));
  Get.lazyPut(() => GetProjectCategoryController(repo: Get.find()));
  Get.lazyPut(() => AddQuickSupportController(repo: Get.find()));
  Get.lazyPut(() => AddTicketsController(repo: Get.find()));
  Get.lazyPut(() => GetNotificationController(repo: Get.find()));


}