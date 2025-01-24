class GetModuleResponse {
  bool? status;
  String? message;
  List<ModuleData>? data;

  GetModuleResponse({this.status, this.message, this.data});

  GetModuleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ModuleData>[];
      json['data'].forEach((v) {
        data!.add(new ModuleData.fromJson(v));
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

class ModuleData {
  String? recordId;
  String? moduleName;

  ModuleData({this.recordId, this.moduleName});

  ModuleData.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    moduleName = json['module_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['record_id'] = this.recordId;
    data['module_name'] = this.moduleName;
    return data;
  }
}
