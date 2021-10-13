import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_tabbar/bottom_nav_custom.dart';

import 'ui/authentication/sign_in_screen.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Appbar',
        ),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(CupertinoIcons.gear_alt, color: Colors.black),
          //   onPressed: () {},
          // ),
          CircleAvatar(
            radius: 22,
            backgroundImage: const AssetImage('assets/avatar.jpg'),
            child: PopupMenuButton(
              offset: const Offset(0, 60),
              icon: const Icon(CupertinoIcons.person, color: Colors.transparent),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              itemBuilder: (BuildContext context) {
                var list = <PopupMenuEntry<Object>>[];
                list.add(PopupMenuItem(
                  child: Row(
                    children: const <Widget>[
                      SizedBox(width: 10,),
                      Icon(CupertinoIcons.person, color: Colors.black),
                      SizedBox(width: 15,),
                      Text(
                        'Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onTap: () {},
                ));
                list.add(PopupMenuItem(
                  child: Row(
                    children: const <Widget>[
                      SizedBox(width: 10,),
                      Icon(CupertinoIcons.gear_alt, color: Colors.black),
                      SizedBox(width: 15,),
                      Text(
                        'Setting',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onTap: () {},
                ));
                list.add(const PopupMenuDivider());

                list.add(PopupMenuItem(
                  child: Row(
                    children: const <Widget>[
                      SizedBox(width: 10,),
                      Icon(CupertinoIcons.power, color: Colors.red),
                      SizedBox(width: 15,),
                      Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  onTap: () {},
                ));

                return list;
              },
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.app,
            size: 30),
            title: const Text('Home',
            style: TextStyle(fontSize: 16)),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.bubble_left_bubble_right,
                size: 30),
            title: const Text('Messages',
                style: TextStyle(fontSize: 16)),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.calendar,
                size: 30),
            title: const Text(
              'Schedule',
                style: TextStyle(fontSize: 16)
            ),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.person_2,
                size: 30),
            title: const Text('Tutors',
                style: TextStyle(fontSize: 16)),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(CupertinoIcons.bookmark,
                size: 30),
            title: const Text('Courses',
                style: TextStyle(fontSize: 16)),
            activeColor: defaultColor,
            textAlign: TextAlign.center,
            titleColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
