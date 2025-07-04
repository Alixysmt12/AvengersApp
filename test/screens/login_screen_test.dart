import 'package:avengers_app/uiscreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:nice_loading_button/nice_loading_button.dart';

void main() {
  testWidgets('Login button exists', (WidgetTester tester) async {
    // Simulate a large screen
    const testKey = Key('test_scaffold');
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(
          size: Size(1080, 1920), // Large screen size
        ),
        child: const GetMaterialApp(
          home: Scaffold(
            key: testKey,
            body: LoginScreen(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Only check for the Login button
    expect(find.widgetWithText(LoadingButton, 'Login'), findsOneWidget);
  });
}
