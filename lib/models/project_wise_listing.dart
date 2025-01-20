class ProjectWiseTicketData {
  bool? status;
  String? message;
  List<ProjectData>? data;

  ProjectWiseTicketData({this.status, this.message, this.data});

  ProjectWiseTicketData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProjectData>[];
      json['data'].forEach((v) {
        data!.add(new ProjectData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectData {
  String? projectId;
  String? name;
  String? count;

  ProjectData({this.projectId, this.name, this.count});

  ProjectData.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_id'] = this.projectId;
    data['name'] = this.name;
    data['count'] = this.count;
    return data;
  }
}
