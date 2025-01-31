class GetLovsResponse {
  bool? status;
  String? message;
  LovData? data;

  GetLovsResponse({this.status, this.message, this.data});

  GetLovsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new LovData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LovData {
  List<Projects>? projects;
  List<ComplaintChannel>? complaintChannel;
  List<Category>? category;
  List<Interface>? interface;
  List<Users>? users;

  LovData(
      {this.projects,
        this.complaintChannel,
        this.category,
        this.interface,
        this.users});

  LovData.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
    if (json['complaint_channel'] != null) {
      complaintChannel = <ComplaintChannel>[];
      json['complaint_channel'].forEach((v) {
        complaintChannel!.add(new ComplaintChannel.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['interface'] != null) {
      interface = <Interface>[];
      json['interface'].forEach((v) {
        interface!.add(new Interface.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    if (this.complaintChannel != null) {
      data['complaint_channel'] =
          this.complaintChannel!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.interface != null) {
      data['interface'] = this.interface!.map((v) => v.toJson()).toList();
    }
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  String? recordId;
  String? projectName;

  Projects({this.recordId, this.projectName});

  Projects.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['record_id'] = this.recordId;
    data['project_name'] = this.projectName;
    return data;
  }
}

class ComplaintChannel {
  String? value;

  ComplaintChannel({this.value});

  ComplaintChannel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class Category {
  String? recordId;
  String? issueCategory;
  String? status;

  Category({this.recordId, this.issueCategory, this.status});

  Category.fromJson(Map<String, dynamic> json) {
    recordId = json['record_id'];
    issueCategory = json['issue_category'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['record_id'] = this.recordId;
    data['issue_category'] = this.issueCategory;
    data['status'] = this.status;
    return data;
  }
}

class Users {
  String? userId;
  String? fullName;

  Users({this.userId, this.fullName});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    return data;
  }
}


class Interface {
  String? value;

  Interface({this.value});

  Interface.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}
