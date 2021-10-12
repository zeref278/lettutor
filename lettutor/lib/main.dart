import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/widgets/bottom_nav_custom.dart';


import 'screens/authentication/sign_in.dart';
import 'screens/authentication/sign_up.dart';
import 'screens/authentication/forgot_password.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Screen 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ForgotPasswordScreen(),
      bottomNavigationBar:BottomNavigationBarCustom(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.app),
            title: Text('Home'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.bubble_left_bubble_right),
            title: Text('Messages'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.calendar),
            title: Text(
              'Schedule',
            ),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.person_2),
            title: Text('Tutors'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),

          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.bookmark),
            title: Text('Courses'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
            titleColor: Colors.black,

          ),

        ],
      ),
    );
  }
}
