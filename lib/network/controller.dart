import 'package:avengers_app/network/repo.dart';
import 'package:avengers_app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../models/dashboard_response.dart';
import '../models/login_response.dart';
import '../models/project_wise_listing.dart';


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

  Future<void> getData(String sid,String quickSupport) async {
    _isLoading = true;
    update();
    Response response = await repo.getListing(AppConstants.LISTING,sid,quickSupport);

    late ProjectWiseTicketData responseModel;

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

    _isLoading = false;
    update();

  }
}

