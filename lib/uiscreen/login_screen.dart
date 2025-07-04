import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nice_loading_button/nice_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/controller.dart';
import '../routes/route_helper.dart';
import '../theme/color_constants.dart';
import '../utils/app_constants.dart';
import '../widgets/edit_text_widget.dart';
import '../widgets/show_custom_snackbar.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with SingleTickerProviderStateMixin {

  bool showFingerprint = false;

  double _opacity = 0.0;
  double _scale = 0.8;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  bool isLoading = false; // Add a boolean to track loading state
  bool isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          biometricOnly: true, // Use only biometrics (no PIN fallback)
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      print("Error: $e");
    }

    if (isAuthenticated) {
      print("Authentication successful!");
      // Navigate to the dashboard or perform some action
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString("email");
      String? password = prefs.getString("password");

      var connectivityResult = await Connectivity().checkConnectivity();

      if(connectivityResult[0].name == ConnectivityResult.none.name){
        showCustomSnackBar("Check your internet connection..", title: "Error");
      }
      else {
        // if (buttonState == ButtonState.idle) {
        //   startLoading();
        // }
        var authController = Get.find<LoginController>();
        authController.login(
          email ?? "",
          password ?? "",
        ).then((response) async {
          if (response.status == true) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // AppConstants.SIGNUP_TOKEN = response.data!.userId!;
            prefs.remove("user_id");
            prefs.setString("user_id", response.data!.userId!);
            // prefs.setString("email", _emailController.text.toString());
            // prefs.setString("password", _passwordController.text.toString());
            // stopLoading();
            Get.offNamed(RouteHelper.getDashboardScreen());
          } else {
            // stopLoading();
            showCustomSnackBar(response.message.toString(), title: "Error");
          }
        });
      }

      Get.offNamed(RouteHelper.getDashboardScreen());
    } else {
      print("Authentication failed");
      showCustomSnackBar("Authentication failed", title: "Error");
    }
  }
  Future<void> checkStoredCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    String? password = prefs.getString("password");

    if (email != null && email.isNotEmpty && password != null && password.isNotEmpty) {
      setState(() {
        showFingerprint = true;
      });
    }
  }
  @override
  void initState() {
    super.initState();

    checkStoredCredentials();

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0), // Start from left
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));


    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; // Get total screen height

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorConstants.primaryColor,
              ColorConstants.primaryDarkColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              // Image at the top
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: _opacity,
              child: Image.asset(
                'assets/images/avengers_logo.png',
                height: 190,
              ),
            ),
              const SizedBox(height: 40),

              // White background with curved top-right radius
              Container(
                height: screenHeight - 170 - 40, // Available height after subtracting image + spacing
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Login Text
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.displayLarge

                    ),
                    const SizedBox(height: 20),

                    // Username TextField
                  SlideTransition(
                    position: _offsetAnimation,
                    child: EditTextWidget(
                      controller: _emailController,
                      hintText: "Username",
                      icon: Icons.mail_outline,
                    ),
                  ),
                    const SizedBox(height: 15),

                    // Password TextField
                    SlideTransition(
                      position: _offsetAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              color: ColorConstants.textPrimary,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: ColorConstants.textPrimary),
                            obscureText: isObscure,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 12.0,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey), // Set hint text color to gray
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none, // Remove the border
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none, // Remove the border
                              ),
                              fillColor: Colors.grey[200], // Set background color to light gray
                              filled: true,
                              suffixIcon: IconButton(
                                color: ColorConstants.primaryColor,
                                icon: Icon(
                                  isObscure ? Icons.visibility : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    Center(
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 600),
                        opacity: _opacity,
                        child: AnimatedScale(
                          duration: Duration(milliseconds: 500),
                          scale: _scale,
                          curve: Curves.easeOutBack, // Smooth bounce effect
                          child: Container(
                            width: MediaQuery.of(context).size.width, // Full width of the screen
                            height: 50, // Height of the button
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), // Same border radius as button
                              gradient: LinearGradient(
                                colors: [ColorConstants.primaryColor, ColorConstants.accentColor], // Example gradient colors
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: LoadingButton(
                              height: 50,
                              borderRadius: 8,
                              animate: true,
                              color: Colors.transparent, // Make button color transparent
                              width: MediaQuery.of(context).size.width,
                              loader: Container(
                                padding: const EdgeInsets.all(10),
                                width: 40,
                                height: 40,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onTap: (startLoading, stopLoading, buttonState) async {

                                var connectivityResult = await Connectivity().checkConnectivity();

                                if (_emailController.text.isEmpty ||
                                    _passwordController.text.isEmpty) {
                                  showCustomSnackBar("User Id and password cannot be empty.");
                                }

                                else if(connectivityResult[0].name == ConnectivityResult.none.name){
                                  showCustomSnackBar("Check your internet connection..", title: "Error");
                                }
                                else {
                                  if (buttonState == ButtonState.idle) {
                                    startLoading();
                                  }
                                  var authController = Get.find<LoginController>();
                                  authController.login(
                                    _emailController.text,
                                    _passwordController.text,
                                  ).then((response) async {
                                    if (response.status == true) {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      AppConstants.SIGNUP_TOKEN = response.data!.userId!;
                                      prefs.remove("user_id");
                                      prefs.setString("user_id", response.data!.userId!);

                                      if(_emailController.text.isNotEmpty){
                                        prefs.setString("email", _emailController.text.toString());
                                        prefs.setString("password", _passwordController.text.toString());
                                      }else{
                                        prefs.setString("email", prefs.getString("email") ?? "");
                                        prefs.setString("password", prefs.getString("password") ?? "");
                                      }

                                      stopLoading();
                                      Get.offNamed(RouteHelper.getDashboardScreen());
                                    } else {
                                      stopLoading();
                                      showCustomSnackBar(response.message.toString(), title: "Error");
                                    }
                                  });
                                }
                              },
                            ),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    showFingerprint
                        ? GestureDetector(
                      onTap: authenticate, // Call the function when tapped
                      child: Center(
                        child: Image.asset(
                          'assets/images/finger_print.png',
                          height: 55,
                        ),
                      ),
                    )
                        : SizedBox.shrink(),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
