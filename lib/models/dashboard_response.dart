class DashboardModel {
  bool? status;
  String? message;
  DataDashboard? dataDashboard;

  DashboardModel({this.status, this.message, this.dataDashboard});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    dataDashboard = json['dataDashboard'] != null
        ? new DataDashboard.fromJson(json['dataDashboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dataDashboard != null) {
      data['dataDashboard'] = this.dataDashboard!.toJson();
    }
    return data;
  }
}

class DataDashboard {
  String? fullName;
  Counters? counters;
  TicketHighlight? ticketHighlight;
  TicketClosureRatio? ticketClosureRatio;
  AvgTicketClosureTime? avgTicketClosureTime;

  DataDashboard(
      {this.fullName,
        this.counters,
        this.ticketHighlight,
        this.ticketClosureRatio,
        this.avgTicketClosureTime});

  DataDashboard.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    counters = json['Counters'] != null
        ? new Counters.fromJson(json['Counters'])
        : null;
    ticketHighlight = json['ticket_highlight'] != null
        ? new TicketHighlight.fromJson(json['ticket_highlight'])
        : null;
    ticketClosureRatio = json['ticket_closure_ratio'] != null
        ? new TicketClosureRatio.fromJson(json['ticket_closure_ratio'])
        : null;
    avgTicketClosureTime = json['avg_ticket_closure_time'] != null
        ? new AvgTicketClosureTime.fromJson(json['avg_ticket_closure_time'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    if (this.counters != null) {
      data['Counters'] = this.counters!.toJson();
    }
    if (this.ticketHighlight != null) {
      data['ticket_highlight'] = this.ticketHighlight!.toJson();
    }
    if (this.ticketClosureRatio != null) {
      data['ticket_closure_ratio'] = this.ticketClosureRatio!.toJson();
    }
    if (this.avgTicketClosureTime != null) {
      data['avg_ticket_closure_time'] = this.avgTicketClosureTime!.toJson();
    }
    return data;
  }
}

class Counters {
  String? pendingAtSupport;
  String? pendingAtQa;
  String? pendingAtDev;
  String? pendingAtPowerapp;

  Counters(
      {this.pendingAtSupport,
        this.pendingAtQa,
        this.pendingAtDev,
        this.pendingAtPowerapp});

  Counters.fromJson(Map<String, dynamic> json) {
    pendingAtSupport = json['pending_at_support'];
    pendingAtQa = json['pending_at_qa'];
    pendingAtDev = json['pending_at_dev'];
    pendingAtPowerapp = json['pending_at_powerapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending_at_support'] = this.pendingAtSupport;
    data['pending_at_qa'] = this.pendingAtQa;
    data['pending_at_dev'] = this.pendingAtDev;
    data['pending_at_powerapp'] = this.pendingAtPowerapp;
    return data;
  }
}

class TicketHighlight {
  String? allOpen;
  String? quickSupport;
  String? dueToday;
  String? timelineRequired;
  String? overdue;
  String? unassigned;

  TicketHighlight(
      {this.allOpen,
        this.quickSupport,
        this.dueToday,
        this.timelineRequired,
        this.overdue,
        this.unassigned});

  TicketHighlight.fromJson(Map<String, dynamic> json) {
    allOpen = json['all_open'];
    quickSupport = json['quick_support'];
    dueToday = json['due_today'];
    timelineRequired = json['timeline_required'];
    overdue = json['overdue'];
    unassigned = json['unassigned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_open'] = this.allOpen;
    data['quick_support'] = this.quickSupport;
    data['due_today'] = this.dueToday;
    data['timeline_required'] = this.timelineRequired;
    data['overdue'] = this.overdue;
    data['unassigned'] = this.unassigned;
    return data;
  }
}

class TicketClosureRatio {
  String? mtd;
  String? ytd;

  TicketClosureRatio({this.mtd, this.ytd});

  TicketClosureRatio.fromJson(Map<String, dynamic> json) {
    mtd = json['mtd'];
    ytd = json['ytd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mtd'] = this.mtd;
    data['ytd'] = this.ytd;
    return data;
  }
}

class AvgTicketClosureTime {
  String? powerApp;
  String? nonPowerApp;

  AvgTicketClosureTime({this.powerApp, this.nonPowerApp});

  AvgTicketClosureTime.fromJson(Map<String, dynamic> json) {
    powerApp = json['power_app'];
    nonPowerApp = json['non_power_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['power_app'] = this.powerApp;
    data['non_power_app'] = this.nonPowerApp;
    return data;
  }
}
