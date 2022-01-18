import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_tag/custom_tag_tutor.dart';
import 'package:lettutor/ui/tutors/tutor_detail_screen.dart';

class CustomCardFeedback extends StatelessWidget {
  final Tutor tutor;
  final double countStars;
  final String feedbacks;

  CustomCardFeedback(
      {Key? key,
      required this.tutor,
      required this.countStars,
      required this.feedbacks})
      : super(key: key);

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
                  backgroundImage: AssetImage(tutor.linkAvatar),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return TutorDetailScreen(
                                    tutorId: tutor.id,
                                  );
                                },
                              ),
                            );
                          },
                          title: Text(
                            tutor.name,
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
                          '2021-10-24 21:46:00',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                        '$countStars',
                    style: TextStyle(color: Colors.redAccent),),
                    Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.yellow,
                    )
                  ],
                )
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
                feedbacks,
                style: TextStyle(color: Colors.black, fontSize: 15),
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
