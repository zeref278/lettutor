
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/themes/name_logo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ProcessingScreen extends StatefulWidget {
  final VoidCallback onTimeout;
  ProcessingScreen({Key? key, required this.onTimeout}) : super(key: key);

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late var spinkit;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));

    spinkit = SpinKitSquareCircle(
      color: Colors.black,
      size: 50.0,
      controller: _animationController,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    if(_animationController.isCompleted) {
      widget.onTimeout();
    }
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NameLogo(),
          spinkit,
        ],
      ),
    );
  }
}