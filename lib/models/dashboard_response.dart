class DashboardModel {
  bool? status;
  String? message;
  DashboardData? data;

  DashboardModel({this.status, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DashboardData.fromJson(json['data']) : null;
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
        ? Counters.fromJson(json['counters'])
        : null;
    ticketHighlights = json['ticket_highlights'] != null
        ? TicketHighlights.fromJson(json['ticket_highlights'])
        : null;
    ticketClosureRatioUHF = json['ticket_closure_ratio_UHF'] != null
        ? TicketClosureRatioUHF.fromJson(json['ticket_closure_ratio_UHF'])
        : null;
    ticketClosureRatio = json['ticket_closure_ratio'] != null
        ? TicketClosureRatioUHF.fromJson(json['ticket_closure_ratio'])
        : null;
    averageTicketClosureTime = json['average_ticket_closure_time'] != null
        ? AverageTicketClosureTime.fromJson(
        json['average_ticket_closure_time'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['greetings'] = greetings;
    if (counters != null) {
      data['counters'] = counters!.toJson();
    }
    if (ticketHighlights != null) {
      data['ticket_highlights'] = ticketHighlights!.toJson();
    }
    if (ticketClosureRatioUHF != null) {
      data['ticket_closure_ratio_UHF'] = ticketClosureRatioUHF!.toJson();
    }
    if (ticketClosureRatio != null) {
      data['ticket_closure_ratio'] = ticketClosureRatio!.toJson();
    }
    if (averageTicketClosureTime != null) {
      data['average_ticket_closure_time'] =
          averageTicketClosureTime!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pending_at_support'] = pendingAtSupport;
    data['pending_at_qa'] = pendingAtQa;
    data['pending_at_dev'] = pendingAtDev;
    data['pending_at_powerapp'] = pendingAtPowerapp;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all_open'] = allOpen;
    data['quick_support'] = quickSupport;
    data['due-today'] = dueToday;
    data['timeline_required'] = timelineRequired;
    data['over_due'] = overDue;
    data['un_assigned'] = unAssigned;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mtd'] = mtd;
    data['ytd'] = ytd;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['power_app'] = powerApp;
    data['non_power_app'] = nonPowerApp;
    return data;
  }
}
