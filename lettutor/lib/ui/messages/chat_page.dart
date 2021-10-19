import 'package:lettutor/models/message.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/ui/courses/courses_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  //const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) =>
                  Messages(message: messages[index])),
        )),
        chatTextField(context),
      ],

    );
  }

  Container chatTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20 / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2))
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              child: IconButton(
                icon: Icon(CupertinoIcons.mic),
                onPressed: () {},
              ),
            ),
            Container(
              width: 32,
              height: 32,
              child: IconButton(
                icon: Icon(CupertinoIcons.paperclip),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Type your message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(CupertinoIcons.smiley),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 20 * 0.01,
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20 * 0.9),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 13,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            )
          ],
          SizedBox(
            width: 20 / 2,
          ),
          Container(
              // margin: EdgeInsets.only(top:pDefaultPadding),

              padding:
                  EdgeInsets.symmetric(horizontal: 20 * 0.5, vertical: 20 / 2),
              decoration: BoxDecoration(
                  color: message.isSender
                      ? defaultColor.withOpacity(0.9)
                      : defaultColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(35)),
              child: Text(
                message.text,
                style: TextStyle(
                    color: message.isSender
                        ? Theme.of(context).textTheme.bodyText1!.color
                        : Theme.of(context).textTheme.bodyText1!.color),
              )),
          if (message.isSender) MessageTick(status: message.messageState)
        ],
      ),
    );
  }
}

class MessageTick extends StatelessWidget {
  final MessageState? status;

  const MessageTick({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageState status) {
      switch (status) {
        case MessageState.notSent:
          return Colors.red;
        case MessageState.notView:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.3);
        case MessageState.viewed:
          return defaultColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: 20 / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageState.notSent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
