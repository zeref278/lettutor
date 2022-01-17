import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_tag/custom_tag_tutor.dart';
import 'package:lettutor/ui/tutors/tutor_detail_screen.dart';

class CustomCardTutor extends StatefulWidget {
  final Tutor tutor;

  CustomCardTutor({
    Key? key,
    required this.tutor,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _CustomCardTutorState();
}

class _CustomCardTutorState extends State<CustomCardTutor> {
  bool isFavorite = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.025,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: size.width * 0.03,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
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
                                  return TutorDetailScreen(tutor: widget.tutor,);
                                },
                              ),
                            );
                          },
                          title: Text(
                            widget.tutor.name,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const <Widget>[
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultPrimaryColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultPrimaryColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultPrimaryColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultPrimaryColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultPrimaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTagTutor(
                        text: Text(
                          widget.tutor.specialities,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {setState(() {
                      isFavorite = !isFavorite;
                    });},
                    icon: Icon(isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                        color: isFavorite ? Colors.red : Colors.black,
                        size: 30))
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(
                left: size.width * 0.04, right: size.width * 0.04),
            child: Text(
              widget.tutor.bio,
              style: TextStyle(color: Colors.black, fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
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
