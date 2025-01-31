class DashboardModel {
  bool? status;
  String? message;
  DashboardData? data;

  DashboardModel({this.status, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DashboardData.fromJson(json['data']) : null;
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

class DashboardData {
  String? fullname;
  String? greetings;
  Counters? counters;
  TicketHighlights? ticketHighlights;
  TicketClosureRatioUHF? ticketClosureRatioUHF;
  TicketClosureRatioUHF? ticketClosureRatio;
  AverageTicketClosureTime? averageTicketClosureTime;

  DashboardData(
      {this.fullname,
        this.greetings,
        this.counters,
        this.ticketHighlights,
        this.ticketClosureRatioUHF,
        this.ticketClosureRatio,
        this.averageTicketClosureTime});

  DashboardData.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    greetings = json['greetings'];
    counters = json['counters'] != null
        ? new Counters.fromJson(json['counters'])
        : null;
    ticketHighlights = json['ticket_highlights'] != null
        ? new TicketHighlights.fromJson(json['ticket_highlights'])
        : null;
    ticketClosureRatioUHF = json['ticket_closure_ratio_UHF'] != null
        ? new TicketClosureRatioUHF.fromJson(json['ticket_closure_ratio_UHF'])
        : null;
    ticketClosureRatio = json['ticket_closure_ratio'] != null
        ? new TicketClosureRatioUHF.fromJson(json['ticket_closure_ratio'])
        : null;
    averageTicketClosureTime = json['average_ticket_closure_time'] != null
        ? new AverageTicketClosureTime.fromJson(
        json['average_ticket_closure_time'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['greetings'] = this.greetings;
    if (this.counters != null) {
      data['counters'] = this.counters!.toJson();
    }
    if (this.ticketHighlights != null) {
      data['ticket_highlights'] = this.ticketHighlights!.toJson();
    }
    if (this.ticketClosureRatioUHF != null) {
      data['ticket_closure_ratio_UHF'] = this.ticketClosureRatioUHF!.toJson();
    }
    if (this.ticketClosureRatio != null) {
      data['ticket_closure_ratio'] = this.ticketClosureRatio!.toJson();
    }
    if (this.averageTicketClosureTime != null) {
      data['average_ticket_closure_time'] =
          this.averageTicketClosureTime!.toJson();
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

class TicketHighlights {
  String? allOpen;
  String? quickSupport;
  String? dueToday;
  String? timelineRequired;
  String? overDue;
  String? unAssigned;

  TicketHighlights(
      {this.allOpen,
        this.quickSupport,
        this.dueToday,
        this.timelineRequired,
        this.overDue,
        this.unAssigned});

  TicketHighlights.fromJson(Map<String, dynamic> json) {
    allOpen = json['all_open'];
    quickSupport = json['quick_support'];
    dueToday = json['due-today'];
    timelineRequired = json['timeline_required'];
    overDue = json['over_due'];
    unAssigned = json['un_assigned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all_open'] = this.allOpen;
    data['quick_support'] = this.quickSupport;
    data['due-today'] = this.dueToday;
    data['timeline_required'] = this.timelineRequired;
    data['over_due'] = this.overDue;
    data['un_assigned'] = this.unAssigned;
    return data;
  }
}

class TicketClosureRatioUHF {
  String? mtd;
  String? ytd;

  TicketClosureRatioUHF({this.mtd, this.ytd});

  TicketClosureRatioUHF.fromJson(Map<String, dynamic> json) {
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

class AverageTicketClosureTime {
  String? powerApp;
  String? nonPowerApp;

  AverageTicketClosureTime({this.powerApp, this.nonPowerApp});

  AverageTicketClosureTime.fromJson(Map<String, dynamic> json) {
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
