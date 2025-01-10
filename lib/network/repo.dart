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

  Future<Response> dashboard() async {
    return await apiClient.dashboard(AppConstants.DASHBOARD_URL);
  }
}
