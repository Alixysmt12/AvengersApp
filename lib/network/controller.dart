import 'package:avengers_app/models/screen_response.dart';
import 'package:avengers_app/network/repo.dart';
import 'package:avengers_app/uiscreen/dashboard_screen.dart';
import 'package:avengers_app/utils/app_constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../models/dashboard_response.dart';
import '../models/login_response.dart';
import '../models/lovs_response.dart';
import '../models/module_response.dart';
import '../models/notification_response.dart';
import '../models/project_category_response.dart';
import '../models/project_wise_listing.dart';
import '../uiscreen/no_connectivity_screen.dart';


///login
class LoginController extends GetxController implements GetxService {
  final LoginRep loginRep;

  LoginController({required this.loginRep});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<LoginResponse> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await loginRep.login(AppConstants.LOGIN_URL, email, password, "12345");

    late LoginResponse responseModel;

    if (response.statusCode == 200) {
      if(response.body["status"] == true){

        Map<String, dynamic> responseBody = response.body;
        responseModel = LoginResponse(
          status: response.body["status"],
          message: response.body["message"],
          data:responseBody["data"] != null
              ? Data.fromJson(responseBody["data"])
              : null,

        );

      }else{
        responseModel = LoginResponse(
            status: response.body["status"],
            message: response.body["message"]);
      }
    }else{
      responseModel = LoginResponse(
          status: response.body["status"],
          message: response.body["message"]);
    }

    _isLoading = false;
    update();
    return responseModel;
  }
}

///dashboard
class DashboardController extends GetxController implements GetxService {
  final DashboardRep repo;

  DashboardController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DashboardModel> _list = [];

  List<DashboardModel> get getList => _list;

  Future<DashboardModel> getData(String sid) async {
    _isLoading = true;
    update();

    // Check internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult[0].name == ConnectivityResult.none.name) {
      // No internet, navigate to NoConnectivityScreen
      Get.to(() => NoConnectivityScreen());
      // return;
    }else{
      Get.to(() => DashboardScreen());
    }

    Response response = await repo.dashboard(AppConstants.DASHBOARD_URL,sid);

    late DashboardModel responseModel;

    if (response.statusCode == 200) {
      if(response.body["status"] == true){

        Map<String, dynamic> responseBody = response.body;
        responseModel = DashboardModel(
          status: response.body["status"],
          message: response.body["message"],
          data:responseBody["data"] != null
              ? DashboardData.fromJson(responseBody["data"])
              : null,

        );

        _list = [];

        _list.add(responseModel);

      }else{
        responseModel = DashboardModel(
            status: response.body["status"],
            message: response.body["message"]);
      }
    }else{
      responseModel = DashboardModel(
          status: response.body["status"],
          message: response.body["message"]);
    }

    _isLoading = false;
    update();
    return responseModel;
  }
}

///get project wise listing
class ProjectWiseListingController extends GetxController implements GetxService {
  final ProjectWiseListingRepo repo;

  ProjectWiseListingController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<ProjectWiseTicketData> _list = [];

  List<ProjectWiseTicketData> get getList => _list;

  // Method to reset the state
  void resetState() {
    _isLoading = false;
    _list = [];
    update(); // Update the state
  }

  Future<void> getData(String sid,String quickSupport) async {
    Response response = await repo.getListing(AppConstants.LISTING,sid,quickSupport);
    update();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = response.body;
      if(response.body["status"] == true){

        final dynamic data = responseBody["data"];
        List<ProjectData>? dataList;
        if (data != null) {
          if (data is List) {
            dataList = data.map((item) => ProjectData.fromJson(item)).toList();
          } else {
            dataList = [ProjectData.fromJson(data)];
          }
        }
        final ProjectWiseTicketData responseModel = ProjectWiseTicketData(
          data: dataList,
          status: responseBody["status"],
          message: responseBody["message"],
        );
        _list = [];
        _list.add(responseModel);
        // print("get response data notification" + responseModel.data![0].firstName.toString());
        _isLoading = true;
      }else{
        _isLoading = true;
        _list = [];
      }
    }else{
      _isLoading = true;
      _list = [];
    }

    _isLoading = true;
    update();

  }
}

///get LOVS
class GetLOVSController extends GetxController implements GetxService {
  final GetLOVSRepo repo;

  GetLOVSController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<GetLovsResponse> _list = [];

  List<GetLovsResponse> get getList => _list;

  // Method to reset the state
  void resetState() {
    _isLoading = false;
    _list = [];
    update(); // Update the state
  }

  Future<void> getData(String sid) async {
    Response response = await repo.getLovs(AppConstants.LOV,sid);
    update();

    if (response.statusCode == 200) {
      if(response.body["status"] == true){

        Map<String, dynamic> responseBody = response.body;
        GetLovsResponse responseModel = GetLovsResponse(
          data: responseBody["data"] != null
              ? LovData.fromJson(responseBody["data"])
              : null,
          status: response.body["status"],
          message: response.body["message"],
        );
        _list = [];

        _list.add(responseModel);

        _isLoading = true;
      }else{
        _isLoading = true;
        _list = [];
      }
    }else{
      _isLoading = true;
      _list = [];
    }

    _isLoading = true;
    update();

  }
}

///get Module LOVS
class GetModuleController extends GetxController implements GetxService {
  final GetModuleRepo repo;

  GetModuleController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<GetModuleResponse> _list = [];

  List<GetModuleResponse> get getList => _list;

  // Method to reset the state
  void resetState() {
    _isLoading = false;
    _list = [];
    update(); // Update the state
  }

  Future<void> getData(String sid,String projectId) async {
    Response response = await repo.getModule(AppConstants.MODULE,sid,projectId);
    update();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = response.body;
      if(response.body["status"] == true){

        final dynamic data = responseBody["data"];
        List<ModuleData>? dataList;
        if (data != null) {
          if (data is List) {
            dataList = data.map((item) => ModuleData.fromJson(item)).toList();
          } else {
            dataList = [ModuleData.fromJson(data)];
          }
        }
        final GetModuleResponse responseModel = GetModuleResponse(
          data: dataList,
          status: responseBody["status"],
          message: responseBody["message"],
        );
        _list = [];
        _list.add(responseModel);
        _isLoading = true;
      }else{
        _isLoading = true;
        _list = [];
      }
    }else{
      _isLoading = true;
      _list = [];
    }

    _isLoading = true;
    update();

  }
}

///get Screen LOVS
class GetScreenController extends GetxController implements GetxService {
  final GetScreenRepo repo;

  GetScreenController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<GetScreenResponse> _list = [];

  List<GetScreenResponse> get getList => _list;

  // Method to reset the state
  void resetState() {
    _isLoading = false;
    _list = [];
    update(); // Update the state
  }

  Future<void> getData(String sid,String projectId) async {
    Response response = await repo.getScreen(AppConstants.SCREEN,sid,projectId);
    update();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = response.body;
      if(response.body["status"] == true){

        final dynamic data = responseBody["data"];
        List<ScreenData>? dataList;
        if (data != null) {
          if (data is List) {
            dataList = data.map((item) => ScreenData.fromJson(item)).toList();
          } else {
            dataList = [ScreenData.fromJson(data)];
          }
        }
        final GetScreenResponse responseModel = GetScreenResponse(
          data: dataList,
          status: responseBody["status"],
          message: responseBody["message"],
        );
        _list = [];
        _list.add(responseModel);
        _isLoading = true;
      }else{
        _isLoading = true;
        _list = [];
      }
    }else{
      _isLoading = true;
      _list = [];
    }

    _isLoading = true;
    update();

  }
}

///get Project Cat LOVS
class GetProjectCategoryController extends GetxController implements GetxService {
  final GetProjectScreenRepo repo;

  GetProjectCategoryController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<ProjectCategoryResponse> _list = [];

  List<ProjectCategoryResponse> get getList => _list;

  // Method to reset the state
  void resetState() {
    _isLoading = false;
    _list = [];
    update(); // Update the state
  }

  Future<void> getData(String sid,String projectId) async {
    Response response = await repo.getProjectId(AppConstants.PROJECT_CATEGORY,sid,projectId);
    update();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = response.body;
      if(response.body["status"] == true){

        final dynamic data = responseBody["data"];
        List<ProjectCategoryData>? dataList;
        if (data != null) {
          if (data is List) {
            dataList = data.map((item) => ProjectCategoryData.fromJson(item)).toList();
          } else {
            dataList = [ProjectCategoryData.fromJson(data)];
          }
        }
        final ProjectCategoryResponse responseModel = ProjectCategoryResponse(
          data: dataList,
          status: responseBody["status"],
          message: responseBody["message"],
        );
        _list = [];
        _list.add(responseModel);
        _isLoading = true;
      }else{
        _isLoading = true;
        _list = [];
      }
    }else{
      _isLoading = true;
      _list = [];
    }

    _isLoading = true;
    update();

  }
}

///POST ADD QUICK SUPPORT
class AddQuickSupportController extends GetxController implements GetxService {
  final AddQuickSupportRepo repo;

  AddQuickSupportController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<LoginResponse> addQuickSupport(String sid,String projectId,String userloginid,String category,String message) async {
    _isLoading = true;
    update();
    Response response = await repo.addQuickSupport(AppConstants.ADD_QUICK_SUPPORT, sid, projectId, userloginid,category,message);

    late LoginResponse responseModel;

    if (response.statusCode == 200) {
      if(response.body["status"] == true){

        Map<String, dynamic> responseBody = response.body;
        responseModel = LoginResponse(
          status: response.body["status"],
          message: response.body["message"],
          data:responseBody["data"] != null
              ? Data.fromJson(responseBody["data"])
              : null,

        );

      }
    }else{
      responseModel = LoginResponse(
          status: response.body["status"],
          message: response.body["message"]);
    }

    _isLoading = false;
    update();
    return responseModel;
  }
}
///POST ADD Tickets SUPPORT
class AddTicketsController extends GetxController implements GetxService {
  final AddSupportTicketsRepo repo;

  AddTicketsController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<LoginResponse> addQuickSupport( String sid,String projectId,String complaintchannel,String issueType,String interface
      ,String module,String summary,String details,String issueCategory,String isSupport,String fileupload1,String fileupload2) async {
    _isLoading = true;
    update();
    Response response = await repo.addTickets(AppConstants.ADD_TICKETS, sid, projectId, complaintchannel,issueType,interface,module,summary,details,issueCategory,isSupport,fileupload1,fileupload2);

    late LoginResponse responseModel;

    if (response.statusCode == 200) {
      if(response.body["status"] == true){

        Map<String, dynamic> responseBody = response.body;
        responseModel = LoginResponse(
          status: response.body["status"],
          message: response.body["message"],
          data:responseBody["data"] != null
              ? Data.fromJson(responseBody["data"])
              : null,

        );

      }
    }else{
      responseModel = LoginResponse(
          status: response.body["status"],
          message: response.body["message"]);
    }

    _isLoading = false;
    update();
    return responseModel;
  }
}

///get Notification
class GetNotificationController extends GetxController implements GetxService {
  final GetNotificationRepo repo;

  GetNotificationController({required this.repo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<NotificationResponse> _list = [];

  List<NotificationResponse> get getList => _list;

  // Method to reset the state
  void resetState() {
    _isLoading = false;
    _list = [];
    update(); // Update the state
  }

  Future<void> getData(String sid) async {
    Response response = await repo.getNotification(AppConstants.NOTIFICATION,sid);
    update();

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = response.body;
      if(response.body["status"] == true){

        final dynamic data = responseBody["data"];
        List<NotificationData>? dataList;
        if (data != null) {
          if (data is List) {
            dataList = data.map((item) => NotificationData.fromJson(item)).toList();
          } else {
            dataList = [NotificationData.fromJson(data)];
          }
        }
        final NotificationResponse responseModel = NotificationResponse(
          data: dataList,
          status: responseBody["status"],
          message: responseBody["message"],
        );
        _list = [];
        _list.add(responseModel);
        _isLoading = true;
      }else{
        _isLoading = true;
        _list = [];
      }
    }else{
      _isLoading = true;
      _list = [];
    }

    _isLoading = true;
    update();

  }
}

