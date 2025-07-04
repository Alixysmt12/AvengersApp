class NotificationResponse {
  bool? status;
  String? message;
  List<NotificationData>? data;

  NotificationResponse({this.status, this.message, this.data});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(NotificationData.fromJson(v));
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

class NotificationData {
  String? recordId;
  String? title;
  String? projectName;
  String? details;
  String? objectType;
  String? objectId;
  String? isRead;

  NotificationData(
      {this.recordId,
        this.title,
        this.projectName,
        this.details,
        this.objectType,
        this.objectId,
        this.isRead});

  NotificationData.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    title = json['title'];
    projectName = json['project_name'];
    details = json['details'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['record_id'] = recordId;
    data['title'] = title;
    data['project_name'] = projectName;
    data['details'] = details;
    data['object_type'] = objectType;
    data['object_id'] = objectId;
    data['is_read'] = isRead;
    return data;
  }
}
