import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_message/custom_conversation.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            width: size.width,
            height: 10,
          ),
          Container(
            width: size.width * 0.9,
            child: CupertinoSearchTextField(
              placeholder: 'Search conversation',
            ),
          ),
          SizedBox(
            width: size.width,
            height: 5,
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Duy Truongggg',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Duy Truongggg',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Semonar phan tich du lieu',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Duy Truongggg',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Duy Truongggg',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Duy Truongggg',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Duy Truongggg',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
          CustomConversation(
            tutor: Tutor(
              name: 'Duy Truongggg',
              linkAvatar: 'assets/avatar.jpg',
            ),
          ),
        ],
      )),
    );
  }
}
