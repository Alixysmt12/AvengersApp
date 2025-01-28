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


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false; // Add a boolean to track loading state
  bool isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
              Image.asset(
                'assets/images/avengers_logo.png',
                height: 190,
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
                    EditTextWidget(
                      controller: _emailController,
                      hintText: "Username",
                      icon: Icons.mail_outline,
                    ),
                    const SizedBox(height: 15),

                    // Password TextField
                    Column(
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

                    const SizedBox(height: 50),

                    Center(
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

                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              showCustomSnackBar(
                                  "User Id and password cannot be empty.");

                            }
                            else {
                              if (buttonState == ButtonState.idle) {
                                startLoading();

                              }
                              var authController = Get.find<LoginController>();
                              authController
                                  .login(
                                _emailController.text,
                                _passwordController.text,
                              )
                                  .then((response) async {
                                if (response.status == true) {

                                  SharedPreferences prefs = await SharedPreferences.getInstance();

                                  AppConstants.SIGNUP_TOKEN = response.data!.userId!;

                                  prefs.remove("user_id");
                                  prefs.setString("user_id", response.data!.userId!);
                                  // Simulate a delay or API call
                                  stopLoading();
                                  Get.offNamed(RouteHelper.getDashboardScreen());

                                } else {
                                  stopLoading();
                                  showCustomSnackBar(response.message.toString(),
                                      title: "Error");
                                }
                              });


                            }

                          },
                        ),
                      ),
                    )
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
