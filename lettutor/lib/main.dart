import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/providers/tutor_provider.dart';

import 'package:lettutor/providers/user_provider.dart';

import 'package:provider/provider.dart';


import 'package:lettutor/services/locator_service.dart';

import 'package:lettutor/ui/authentication/sign_in_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
        ChangeNotifierProvider(create: (ctx) => TutorProvider()),
        ChangeNotifierProvider(create: (ctx) => CourseProvider()),
      ],
      child: MaterialApp(
        title: 'sTutoring',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignInScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


