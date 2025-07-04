import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';

// Top-level function for background message handling
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel("id", "name is",
      description: "new", importance: Importance.defaultImportance);

  final _localNotification = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    print("Full FCM Message: ${message.toString()}"); // Prints full FCM message
    print("Message Data: ${message.data}"); // Prints only data payload

    String? screen = message.data["screen"];
    print("Extracted Screen: $screen"); // Prints extracted screen name

    if (screen == null || screen.isEmpty) {
      print("Error: Screen key is missing in FCM payload");
      Get.offNamed(RouteHelper.getNotificationScreen()); // Default fallback
      return;
    }

    if (Get.isRegistered<GetMaterialApp>()) {
      print("Navigating to: $screen");
      Get.offNamed(screen);
    } else {
      print("GetX not initialized yet, delaying navigation...");
      Future.delayed(Duration(seconds: 1), () {
        print("Now navigating to: $screen");
        Get.offNamed(screen);
      });
    }
  }


  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            importance: Importance.high, // Ensure notifications appear in foreground
            priority: Priority.high, // Immediate notification appearance
            icon: "@mipmap/ic_launcher", //Use correct icon
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });

  }

  Future<void> initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings("drawable/ic_launcher");
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        final String? payload = notificationResponse.payload;
        if (payload != null) {
          final message = RemoteMessage.fromMap(jsonDecode(payload));
          handleMessage(message);
        }
      },
    );

    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> initNotifications() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      print("Notifications permission denied!");
      return;
    }

    try {
      final fCMToken = await _firebaseMessaging.getToken();
      print("Token: $fCMToken");
      await initPushNotifications();
      await initLocalNotifications();
    } catch (e) {
      print("FCM Init Error: ${e.toString()}");
    }
  }

}
