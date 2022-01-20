import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/services/tutor_service.dart';
import 'package:lettutor/themes/name_logo.dart';
import 'package:lettutor/ui/custom_widgets/custom_tabbar/bottom_nav_custom.dart';
import 'package:lettutor/ui/custom_widgets/custom_tabbar/tab_navigator.dart';
import 'package:lettutor/ui/account_management/profile_screen.dart';
import 'package:lettutor/ui/account_management/setting_screen.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  bool _isLoading2 = true;
  bool _isLoading3 = true;
  bool _isLoading4 = true;

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).fetchUserInfo().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    Provider.of<TutorProvider>(context, listen: false)
        .fetchListTutor("4", "1")
        .then((_) {
      setState(() {
        _isLoading2 = false;
      });
    });
    Provider.of<ScheduleProvider>(context, listen: false)
        .fetchUpComingClassed(page: "1", perPage: "1000")
        .then((_) {
      setState(() {
        _isLoading3 = false;
      });
    });


    super.initState();
  }

  String _currentPage = 'Home';
  List<String> pageKeys = ['Home', 'Messages', 'Schedule', 'Tutors', 'Courses'];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'Home': GlobalKey<NavigatorState>(),
    'Messages': GlobalKey<NavigatorState>(),
    'Schedule': GlobalKey<NavigatorState>(),
    'Tutors': GlobalKey<NavigatorState>(),
    'Courses': GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
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
    return _isLoading || _isLoading2  || _isLoading3// || _isLoading4
        ? Scaffold(
            backgroundColor: defaultBackgroundColor,
            body: Column(
              children: [
                const NameLogo(),
                SizedBox(height: 50,),
                CircularProgressIndicator(),
              ],
            ),
          )
        : WillPopScope(
            onWillPop: () async {
              final isFirstRouteInCurrentTab =
                  !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
              if (isFirstRouteInCurrentTab) {
                if (_currentPage != 'Home') {
                  _selectTab('Home', 0);

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
              // body: ScheduleScreen(),
              appBar: AppBar(
                title: Text(
                  _currentPage,
                ),
                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                elevation: 1.5,
                backgroundColor: Colors.white,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.gear_alt,
                      color: Colors.black,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SettingScreen();
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Consumer<UserProvider>(builder: (context, userData, _) {
                    return InkWell(
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            Image.network(userData.user.linkAvatar).image,
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfileScreen();
                            },
                          ),
                        );
                      },
                    );
                  }),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              bottomNavigationBar: BottomNavigationBarCustom(
                selectedIndex: _selectedIndex,
                showElevation: true,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                onItemSelected: (int index) {
                  _selectTab(pageKeys[index], index);
                },
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: const Icon(CupertinoIcons.app, size: 30),
                    title: const Text('Home', style: TextStyle(fontSize: 16)),
                    activeColor: defaultPrimaryColor,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: const Icon(CupertinoIcons.bubble_left_bubble_right,
                        size: 30),
                    title:
                        const Text('Messages', style: TextStyle(fontSize: 16)),
                    activeColor: defaultPrimaryColor,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: const Icon(CupertinoIcons.calendar, size: 30),
                    title:
                        const Text('Schedule', style: TextStyle(fontSize: 16)),
                    activeColor: defaultPrimaryColor,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: const Icon(CupertinoIcons.person_2, size: 30),
                    title: const Text('Tutors', style: TextStyle(fontSize: 16)),
                    activeColor: defaultPrimaryColor,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: const Icon(CupertinoIcons.bookmark, size: 30),
                    title:
                        const Text('Courses', style: TextStyle(fontSize: 16)),
                    activeColor: defaultPrimaryColor,
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
