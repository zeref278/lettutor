import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_tag/custom_tag_tutor.dart';

class CustomCardTutor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomCardTutorState();
}

class _CustomCardTutorState extends State<CustomCardTutor> {
  bool isLiked = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
        children: <Widget>[
          SizedBox(
            height: size.height * 0.025,
          ),
          Container(
            height: size.height * 0.12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: size.width * 0.03,
                ),
                const CircleAvatar(
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
                          onPressed: () {},
                          title: const Text(
                            'Hello World',
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
                            color: defaultColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultColor,
                          ),
                          Icon(
                            CupertinoIcons.star_fill,
                            size: 16,
                            color: defaultColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTagTutor(
                        text: const Text(
                          'English for kid',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.heart, size: 30))
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: const Text(
                "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. I am an outgoing person and I have this passion for dealing with different people and seeing them progress with my help as their teacher. In fact, making friends is one of my best skills. I am very good at adapting to new environments and new situations. I am very friendly and can easily get along well with everyone. I have obtained a 120-Hour TEFL Certificate. I get a variety of teaching techniques. I know that there are fast and not so fast learners. So don't worry, I will be with you every step of the way going at your own pace. Let's practice what you already know and add something new each day. With my skills and experiences, I can assure you that I can provide adequate English learning effectively and efficiently. Together, let's make English learning fun.",
                style: TextStyle(color: Colors.black, fontSize: 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
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
