import 'package:flutter/material.dart';
import 'package:lettutor/main.dart';
import 'package:lettutor/ui/courses/courses_screen.dart';
import 'package:lettutor/ui/messages/messages_screen.dart';
import 'package:lettutor/ui/schedule/schedule_screen.dart';
import 'package:lettutor/ui/tutors/tutors_screen.dart';
import '../../home.dart';
import 'bottom_nav_custom.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child ;
    if(tabItem == 'Home')
      child = HomeScreen();
    else if(tabItem == 'Messages')
      child = MessagesScreen();
    else if(tabItem == 'Schedule')
      child = ScheduleScreen();
    else if(tabItem == 'Tutors')
      child = TutorsScreen();
    else //if(tabItem == 'Courses')
      child = CoursesScreen();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child
        );
      },
    );
  }
}