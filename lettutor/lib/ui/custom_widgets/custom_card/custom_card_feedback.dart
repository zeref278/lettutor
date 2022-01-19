import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/models/feedback.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_tag/custom_tag_tutor.dart';

class CustomCardFeedback extends StatelessWidget {
  final MyFeedback feedback;

  const CustomCardFeedback({Key? key, required this.feedback}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      //height: size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: size.width * 0.03,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: Image.network(feedback.linkAvatar).image,
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomTextButton(
                          onPressed: () {
                          },
                          title: Text(
                            feedback.name,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTagTutor(
                        text: Text(
                          DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.parse(feedback.date)),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                        '${feedback.rating}',
                    style: TextStyle( fontSize: 18, color: Colors.redAccent, fontWeight: FontWeight.bold),),
                    Icon(
                      CupertinoIcons.star_fill,
                      size: 26,
                      color: Colors.amber,
                    )
                  ],
                ),
                SizedBox(width: 5,)
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                left: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 2,
                ),
              )),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                feedback.content,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
