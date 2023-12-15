import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UI/login_page.dart';
import 'UI/login_screen.dart';

Future<void> main() async {
  // print('-- main');
  // //enableFlutterDriverExtension();
  // WidgetsFlutterBinding.ensureInitialized();
  // print('-- WidgetsFlutterBinding.ensureInitialized');

  // await Firebase.initializeApp();


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
