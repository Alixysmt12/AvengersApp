import 'package:avengers_app/network/repo.dart';
import 'package:get/get.dart';

import '../models/dashboard_response.dart';
import '../models/login_response.dart';


///login
class LoginController extends GetxController implements GetxService {
  final LoginRep loginRep;

  LoginController({required this.loginRep});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<LoginResponse> login(String email, String password) async {
    _isLoading = true;
    update();
    Response response = await loginRep.login("login", email, password, "12345");

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

  Future<DashboardModel> login() async {
    _isLoading = true;
    update();
    Response response = await repo.dashboard();

    late DashboardModel responseModel;

    if (response.statusCode == 200) {
      if(response.body["status"] == true){

        Map<String, dynamic> responseBody = response.body;
        responseModel = DashboardModel(
          status: response.body["status"],
          message: response.body["message"],
          dataDashboard:responseBody["dataDashboard"] != null
              ? DataDashboard.fromJson(responseBody["dataDashboard"])
              : null,

        );

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
