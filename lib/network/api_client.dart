import 'package:get/get.dart';

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
      return response;
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
      return response;
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
      return response;
    } catch (e) {
      print('Error during login: $e');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}

