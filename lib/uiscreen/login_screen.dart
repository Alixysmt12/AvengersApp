import 'package:flutter/material.dart';
import 'package:nice_loading_button/nice_loading_button.dart';

import '../theme/color_constants.dart';
import '../widgets/edit_text_widget.dart';


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
                      child: LoadingButton(
                        height: 50,
                        borderRadius: 8,
                        animate: true,
                        color: ColorConstants.accentColor,
                        width: MediaQuery.of(context).size.width,
                        loader: Container(
                          padding: const EdgeInsets.all(10),
                          width: 40,
                          height: 40,
                          child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        child: const Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,),),
                        onTap: (startLoading, stopLoading, buttonState) async {
                          if (buttonState == ButtonState.idle) {
                            startLoading();
                            // Do something here
                            await Future.delayed(const Duration(seconds: 5));
                            stopLoading();
                          }
                        },
                      ),
                    ),

                    // Login Button
                /*    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle login action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF274293),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),*/
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
