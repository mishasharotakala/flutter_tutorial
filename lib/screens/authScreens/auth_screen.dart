import 'package:flutter/material.dart';
import 'package:flutter_tutorial/screens/authScreens/login_tab_page.dart';
import 'package:flutter_tutorial/screens/authScreens/registration_tab_page.dart';

class AuthScreen extends StatefulWidget {

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override 
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Company',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              //color: Colors.white,
        ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 41, 64, 84),
            indicatorWeight: 6,
            tabs: [
              Tab(
                text: 'Login',
                icon: Icon(
                  Icons.lock,
                ),
              ),
              Tab(
                text: 'Registration',
                icon: Icon(
                  Icons.person,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              LoginScreen(),
              RegistrationScreen(),
            ],
          ),
        ),
      ),
    );
  }
}