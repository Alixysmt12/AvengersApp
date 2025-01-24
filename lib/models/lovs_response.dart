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
  List<String>? complaintChannel;
  List<TicketCategory>? ticketCategory;
  List<String>? interface;
  List<Users>? users;

  LovData(
      {this.projects,
        this.complaintChannel,
        this.ticketCategory,
        this.interface,
        this.users});

  LovData.fromJson(Map<String, dynamic> json) {
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
    complaintChannel = json['complaint_channel'].cast<String>();
    if (json['ticket_category'] != null) {
      ticketCategory = <TicketCategory>[];
      json['ticket_category'].forEach((v) {
        ticketCategory!.add(new TicketCategory.fromJson(v));
      });
    }
    interface = json['interface'].cast<String>();
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
    data['complaint_channel'] = this.complaintChannel;
    if (this.ticketCategory != null) {
      data['ticket_category'] =
          this.ticketCategory!.map((v) => v.toJson()).toList();
    }
    data['interface'] = this.interface;
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

class TicketCategory {
  String? recordId;
  String? issueCategory;
  String? status;

  TicketCategory({this.recordId, this.issueCategory, this.status});

  TicketCategory.fromJson(Map<String, dynamic> json) {
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
