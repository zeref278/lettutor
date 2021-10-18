import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/account_management/profile_screen.dart';
import 'package:lettutor/ui/account_management/setting_screen.dart';
import 'package:lettutor/ui/custom_widgets/custom_tabbar/bottom_nav_custom.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_icon_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_tabbar/tab_navigator.dart';
import 'package:lettutor/ui/home.dart';
import 'package:lettutor/ui/messages/chat_page.dart';
import 'package:lettutor/ui/messages/messages_screen.dart';
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
  String _currentPage = 'Home';
  List<String> pageKeys = ['Home', 'Messages', 'Schedule', 'Tutors', 'Courses' ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'Home': GlobalKey<NavigatorState>(),
    'Messages': GlobalKey<NavigatorState>(),
    'Schedule': GlobalKey<NavigatorState>(),
    'Tutors': GlobalKey<NavigatorState>(),
    'Courses': GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if(tabItem == _currentPage ){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != 'Home') {
            _selectTab('Home', 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator('Home'),
            _buildOffstageNavigator('Messages'),
            _buildOffstageNavigator('Schedule'),
            _buildOffstageNavigator('Tutors'),
            _buildOffstageNavigator('Courses'),
          ],
        ),
        appBar: AppBar(
          title: const Text(
            'Appbar',
          ),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: <Widget>[
            CircleAvatar(
              radius: 22,
              backgroundImage: const AssetImage('assets/avatar.jpg'),
              child: PopupMenuButton(
                offset: const Offset(0, 60),
                icon:
                    const Icon(CupertinoIcons.person, color: Colors.transparent),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                itemBuilder: (BuildContext context) {
                  var list = <PopupMenuEntry<Object>>[];
                  list.add(PopupMenuItem(
                    child: const CustomIconButton(
                        icon: Icon(CupertinoIcons.person, color: Colors.black),
                        title: Text(
                          'Profile',
                        )),
                    onTap: () {},
                  ));
                  list.add(PopupMenuItem(
                    child: const CustomIconButton(
                        icon: Icon(CupertinoIcons.gear_alt, color: Colors.black),
                        title: Text(
                          'Setting',
                        )),
                    onTap: () {},
                  ));
                  list.add(const PopupMenuDivider());

                  list.add(PopupMenuItem(
                    child: const CustomIconButton(
                        icon: Icon(CupertinoIcons.square_arrow_left,
                            color: Colors.red),
                        title: Text('Sign Out',
                            style: TextStyle(color: Colors.red))),
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
          selectedIndex: _selectedIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (int index) { _selectTab(pageKeys[index], index); },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.app, size: 30),
              title: const Text('Home', style: TextStyle(fontSize: 16)),
              activeColor: defaultColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.bubble_left_bubble_right, size: 30),
              title: const Text('Messages', style: TextStyle(fontSize: 16)),
              activeColor: defaultColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.calendar, size: 30),
              title: const Text('Schedule', style: TextStyle(fontSize: 16)),
              activeColor: defaultColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.person_2, size: 30),
              title: const Text('Tutors', style: TextStyle(fontSize: 16)),
              activeColor: defaultColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.bookmark, size: 30),
              title: const Text('Courses', style: TextStyle(fontSize: 16)),
              activeColor: defaultColor,
              textAlign: TextAlign.center,
              titleColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
