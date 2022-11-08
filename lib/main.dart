import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/app_theme.dart';
import 'package:flutter_tutorial/screens/authScreens/auth_screen.dart';
import 'package:flutter_tutorial/screens/myscreens/login_screen.dart';
import 'package:flutter_tutorial/screens/myscreens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: SignUpScreen(),
      //home: LoginScreen(),
      //home: AuthScreen(),
      //home: const Home(),
      //home: const FirstPage(),
      //home: const DummyPage(),
    );
  }
}