class LoginResponse {
  bool? status;
  String? message;
  Data? data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? userType;
  String? loginId;
  String? emailAddress;
  String? fullName;
  String? userRole;
  String? applePushId;
  String? androidPushId;
  bool? status;
  String? message;

  Data(
      {this.userId,
        this.userType,
        this.loginId,
        this.emailAddress,
        this.fullName,
        this.userRole,
        this.applePushId,
        this.androidPushId,
        this.status,
        this.message});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userType = json['user_type'];
    loginId = json['login_id'];
    emailAddress = json['email_address'];
    fullName = json['full_name'];
    userRole = json['user_role'];
    applePushId = json['apple_push_id'];
    androidPushId = json['android_push_id'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_type'] = userType;
    data['login_id'] = loginId;
    data['email_address'] = emailAddress;
    data['full_name'] = fullName;
    data['user_role'] = userRole;
    data['apple_push_id'] = applePushId;
    data['android_push_id'] = androidPushId;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
