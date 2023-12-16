import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'Modules/firebase_option.dart';
import 'UI/login_page.dart';
import 'UI/login_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';


Future<void> main() async {
  print('-- main');
  //enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  print('-- WidgetsFlutterBinding.ensureInitialized');
  await Firebase.initializeApp(
    name: "Github UI",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WebView.platform = SurfaceAndroidWebView();
  /*FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  final initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    //iOS: initializationSettingsIOS,
  );
  print("sdsfsfsf");
  String? token = await messaging.getToken();
print(token);*/
  /*try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Error initializing Firebase: $e");
  }*/
  print("sdsfsd");


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
