import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_tabbar/bottom_nav_custom.dart';


import 'ui/authentication/sign_in_screen.dart';
import 'ui/authentication/sign_up_screen.dart';
import 'ui/authentication/forgot_password_screen.dart';

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
            icon: const Icon(CupertinoIcons.app),
            title: const Text('Home'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.bubble_left_bubble_right),
            title: const Text('Messages'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.calendar),
            title: const Text(
              'Schedule',
            ),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.person_2),
            title: const Text('Tutors'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),

          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.bookmark),
            title: const Text('Courses'),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
            titleColor: Colors.black,

          ),

        ],
      ),
    );
  }
}
