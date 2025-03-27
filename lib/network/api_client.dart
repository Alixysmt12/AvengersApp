import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';
import '../utils/clearing_shared_preference.dart';
import '../widgets/show_custom_snackbar.dart';

class ApiClient extends GetConnect implements GetxService {
  late final String appBaseURL;
  late String token;
  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseURL, this.token = ""}) {
    baseUrl = appBaseURL;
    timeout = const Duration(seconds: 60);
    // allowAutoSignedCert = true;
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8', // Use URL Encoded content type
    };
  }

  /// Login
  Future<Response> login(dynamic body) async {
    print("Sending request with body: $body");

    try {
      // URL-encoded body requires 'FormData'
      // final formData = FormData(queryParams);
      Response response = await post("", body, headers: _mainHeader);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      return _handleResponse(response);
    } catch (e) {
      print('Error during login: $e');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  ///Dashboard
  Future<Response> dashboard(dynamic body) async {
    try {
      print("Response body: $body");
      Response response = await post("",body, headers: _mainHeader);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      return _handleResponse(response);
    } catch (e) {
      print('Error during login: $e');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  ///Listing
  Future<Response> getListing(dynamic body) async {
    try {
      print("Response body: $body");
      Response response = await post("",body, headers: _mainHeader);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      return _handleResponse(response);
    } catch (e) {
      print('Error during login: $e');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Response _handleResponse(Response response) {
    if (kDebugMode) {
      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return response; // Success

      case 400:
      case 401:
      case 403:
        if (Get.currentRoute != RouteHelper.getLoginScreen()) { // Prevent infinite loop
          showCustomSnackBar("Session Expired", title: "Please log in again.");
          clearSharedPreferences();
          Get.offAllNamed(RouteHelper.getLoginScreen());
        }
        return Response(statusCode: response.statusCode, statusText: "Unauthorized");

      case 500:
        showCustomSnackBar("Server Error", title: "Something went wrong. Try again later.");
        return Response(statusCode: 500, statusText: "Server Error");

      default:
      // Get.snackbar("Error", "Unexpected error: ${response.bodyString}");
        return Response(statusCode: response.statusCode, statusText: "Unexpected Error");
    }
  }
}

