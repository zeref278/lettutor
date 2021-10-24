import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/constants/ui_constants.dart';

class CustomCardMeeting extends StatelessWidget {
  final double width;
  final void Function() onPressedFirstButton;
  final void Function() onPressedSecondButton;
  final Tutor tutor;
  final bool isBegin;
  final String date;
  final String startTime;
  final String endTime;

  const CustomCardMeeting(
      {Key? key,
      required this.width,
      required this.onPressedFirstButton,
      required this.onPressedSecondButton,
      required this.isBegin,
      required this.startTime,
      required this.endTime,
      required this.date,
      required this.tutor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(tutor.linkAvatar),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tutor.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(date,
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: defaultPrimaryColor),
                          color: defaultPrimaryColor.withOpacity(0.2)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Text(startTime),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green),
                          color: Colors.green.withOpacity(0.2)),
                    ),
                    Text(' - '),
                    Container(
                      child: Text(endTime),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.red),
                          color: Colors.red.withOpacity(0.2)),
                    ),
                  ],
                ),
              ],
            ),
          ]),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: onPressedFirstButton,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent),
                      // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //     EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                      ))),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: onPressedSecondButton,
                  child: Text(
                    'Enter',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          isBegin ? Colors.green : Colors.grey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
