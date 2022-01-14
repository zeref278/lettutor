import 'package:flutter/material.dart';
import 'package:lettutor/models/conversation.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

import 'chat_page.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
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
              Navigator.of(context).push(
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
