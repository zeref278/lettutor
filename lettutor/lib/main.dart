import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/providers/tutor_provider.dart';

import 'package:lettutor/providers/user_provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lettutor/services/auth_services.dart';
import 'package:lettutor/themes/name_logo.dart';
import 'package:lettutor/ui/home_screen/home_nav.dart';

import 'package:provider/provider.dart';

import 'package:lettutor/services/locator_service.dart';

import 'package:lettutor/ui/authentication/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _result = -1;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
        ChangeNotifierProvider(create: (ctx) => TutorProvider()),
        ChangeNotifierProvider(create: (ctx) => CourseProvider()),
        ChangeNotifierProvider(create: (ctx) => ScheduleProvider()),
      ],
      child: MaterialApp(
        title: 'sTutoring',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          //duration: 5000,
          splashIconSize: 250,
          splash: NameLogo(),
          function: () async {
            AuthServices.instance.checkAlreadySignin().then((result) {
              setState(() {
                _result = result;
              });

            });
            if(_result == 1) {
              await Provider.of<UserProvider>(context, listen: false)
                  .fetchUserInfo();
              await Provider.of<TutorProvider>(context, listen: false)
                  .fetchListTutor("4", "1");
            }
          },
          nextScreen: _result == 1 ? MyHomePage() : SignInScreen(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
