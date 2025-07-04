import 'package:get/get.dart';

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

  Future<Response> getModule(String action, String sid,String projectId) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
      "projectId": projectId
    });
  }
}

class GetScreenRepo {
  late final ApiClient apiClient;

  GetScreenRepo({required this.apiClient});

  Future<Response> getScreen(String action, String sid,String projectId) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
      "moduleId": projectId
    });
  }
}

class GetProjectScreenRepo {
  late final ApiClient apiClient;

  GetProjectScreenRepo({required this.apiClient});

  Future<Response> getProjectId(String action, String sid,String projectId) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
      "projectId": projectId
    });
  }
}

class AddQuickSupportRepo {
  late final ApiClient apiClient;

  AddQuickSupportRepo({required this.apiClient});

  Future<Response> addQuickSupport(String action, String sid,String projectId,String userloginid,String category,String message) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
      "projectId": projectId,
      "userloginid": userloginid,
      "category": category,
      "message": message
    });
  }
}

class AddSupportTicketsRepo {
  late final ApiClient apiClient;

  AddSupportTicketsRepo({required this.apiClient});

  Future<Response> addTickets(String action, String sid,String projectId,String complaintchannel,String screen,String issueType,String interface
      ,String module,String summary,String details,String issueCategory,String isSupport,String userId,String fileupload1,String fileupload2) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
      "projectId": projectId,
      "screen": screen,
      "complaintchannel":complaintchannel,
      "issueType": issueType,
      "interface": interface,
      "module": module,
      "summary": summary,
      "details": details,
      "issueCategory": issueCategory,
      "isSupport": isSupport,
      "user_id": userId,
      "fileupload1": fileupload1,
      "fileupload2": fileupload2
    });
  }
}

class GetNotificationRepo {
  late final ApiClient apiClient;

  GetNotificationRepo({required this.apiClient});

  Future<Response> getNotification(String action, String sid) async {
    print("end url: $action");
    return await apiClient.dashboard({
      "action": action,
      "sid": sid,
    });
  }
}

