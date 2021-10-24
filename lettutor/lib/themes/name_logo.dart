import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/ui_constants.dart';

class NameLogo extends StatelessWidget {
  const NameLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 40.0, bottom: 0.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.fill)),
          ),
          Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                'sTutoring',
                style: GoogleFonts.fredokaOne(
                  textStyle: TextStyle(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3.5
                      ..color = Colors.black,
                  ),
                ),
              ),
              Text(
                'sTutoring',
                style: GoogleFonts.fredokaOne(
                  textStyle: const TextStyle(
                    color: defaultPrimaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
