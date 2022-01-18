import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_rating_bar/custom_rating_bar.dart';
import 'package:lettutor/ui/custom_widgets/custom_stack_avatar/custom_avatar_active.dart';
import 'package:lettutor/ui/custom_widgets/custom_tag/custom_tag_tutor.dart';
import 'package:lettutor/ui/tutors/tutor_detail_screen.dart';
import 'package:provider/provider.dart';

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
                CustomAvatarActive(
                  avatar: Image.network(widget.tutor.linkAvatar).image,
                  isActive: widget.tutor.isActivated,
                  avatarSize: 35,
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
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return TutorDetailScreen(
                                    tutor: widget.tutor,
                                  );
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
                      CustomRatingBar(rating: widget.tutor.rating, onRatingUpdate: (double){}),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTagTutor(
                        text: Text(
                          widget.tutor.specialities[0],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<TutorProvider>(
                  builder: (context, tutorData, _) {
                    return IconButton(
                        onPressed: () async {
                          await tutorData.addTutorToFavorite();
                        },
                        icon: Icon(
                            tutorData.tutor.isFavorite
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: widget.tutor.isFavorite ? Colors.red : Colors.black,
                            size: 30));
                  },
                ),

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
