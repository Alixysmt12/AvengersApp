import 'package:get/get.dart';

import '../utils/app_constants.dart';
import 'api_client.dart';

class LoginRep {
  late final ApiClient apiClient;

  LoginRep({required this.apiClient});

  Future<Response> login(
      String action, String email, String password, String applePushId) async {
    return await apiClient.login({
      "action": action,
      "email": email,
      "password": password,
      "apple_push_id": applePushId
    });
  }
}


class DashboardRep {
  late final ApiClient apiClient;

  DashboardRep({required this.apiClient});

  Future<Response> dashboard(String action, String sid) async {
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
    });
  }
}

class ProjectWiseListingRepo {
  late final ApiClient apiClient;

  ProjectWiseListingRepo({required this.apiClient});

  Future<Response> getListing(String action, String sid,String quickSupport) async {
    return await apiClient.dashboard({
      "action": action,
      "type": quickSupport,
      "sid": sid,
    });
  }
}

class GetLOVSRepo {
  late final ApiClient apiClient;

  GetLOVSRepo({required this.apiClient});

  Future<Response> getLovs(String action, String sid) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
    });
  }
}

class GetModuleRepo {
  late final ApiClient apiClient;

  GetModuleRepo({required this.apiClient});

  Future<Response> getModule(String action, String sid) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
    });
  }
}
