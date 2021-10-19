import 'package:flutter/material.dart';
import 'package:lettutor/models/conversation.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_message/custom_conversation.dart';

import 'chat_page.dart';

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
            conversation: Conversation(
              tutor: myTutor,
              lastMessage: messages.last,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatPage();
                  },
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
