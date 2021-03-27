import 'package:flutter/material.dart';
import 'package:winhacks_21/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:winhacks_21/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
