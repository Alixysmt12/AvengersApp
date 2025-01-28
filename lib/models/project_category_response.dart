class ProjectCategoryResponse {
  bool? status;
  String? message;
  List<ProjectCategoryData>? data;

  ProjectCategoryResponse({this.status, this.message, this.data});

  ProjectCategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProjectCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new ProjectCategoryData.fromJson(v));
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

class ProjectCategoryData {
  String? title;

  ProjectCategoryData({this.title});

  ProjectCategoryData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}
