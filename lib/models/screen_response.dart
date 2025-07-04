class GetScreenResponse {
  bool? status;
  String? message;
  List<ScreenData>? data;

  GetScreenResponse({this.status, this.message, this.data});

  GetScreenResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ScreenData>[];
      json['data'].forEach((v) {
        data!.add(ScreenData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScreenData {
  String? recordId;
  String? screenName;

  ScreenData({this.recordId, this.screenName});

  ScreenData.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    screenName = json['screen_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['record_id'] = recordId;
    data['screen_name'] = screenName;
    return data;
  }
}
