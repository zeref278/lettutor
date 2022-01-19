import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:provider/provider.dart';

class CustomCardMeeting extends StatefulWidget {
  final double width;
  final void Function() onPressedFirstButton;
  final void Function() onPressedSecondButton;
  final String tutorName;
  final String avatarLink;
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
      required this.tutorName,
      required this.avatarLink})
      : super(key: key);

  @override
  State<CustomCardMeeting> createState() => _CustomCardMeetingState();
}

class _CustomCardMeetingState extends State<CustomCardMeeting> {
  bool _isLoading = false;

  @override
  void initState() {
    // Provider.of<TutorProvider>(context, listen: false)
    //     .fetchTutorInfo(widget.tutorId)
    //     .then((tutor) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator()
        : Container(
            width: widget.width,
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
                    backgroundImage: Image.network(widget.avatarLink).image,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.tutorName,
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
                            child: Text(widget.date,
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: defaultPrimaryColor),
                                color: defaultPrimaryColor.withOpacity(0.2)),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: Text(widget.startTime),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.green),
                                color: Colors.green.withOpacity(0.2)),
                          ),
                          Text(' - '),
                          Container(
                            child: Text(widget.endTime),
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
                        onPressed: widget.onPressedFirstButton,
                        child: Text(
                          widget.isBegin ? 'Cancel' : 'Record',
                          style: TextStyle(
                              color: widget.isBegin ? Colors.white : Colors.black, fontWeight: FontWeight.w600),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                widget.isBegin ? Colors.redAccent : Colors.green),
                            // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            //     EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                            ))),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: widget.onPressedSecondButton,
                        child: Text(
                          widget.isBegin ? 'Join' : 'Review',
                          style: TextStyle(
                              color: widget.isBegin ? Colors.white :Colors.black, fontWeight: FontWeight.w600),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                widget.isBegin ? Colors.green : defaultPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
