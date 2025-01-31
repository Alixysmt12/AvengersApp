import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? email = prefs.getString('email');
  // String? password = prefs.getString('password');
  await prefs.clear();
  //  await prefs.setString('email', email ?? "");
  // await prefs.setString('password', password ?? "");
}
