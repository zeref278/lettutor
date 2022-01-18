import 'package:flutter/material.dart';
import 'package:lettutor/models/conversation.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

class CustomConversation extends StatelessWidget {
  final Conversation conversation;
  final void Function() onTap;

  const CustomConversation({Key? key, required this.conversation, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CustomAvatarActive(isActive: true, avatar: AssetImage('assets/avatar.jpg'),),
      title: Text(
        conversation.tutor.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        conversation.lastMessage.isSender
            ? 'You: ' + conversation.lastMessage.text
            : conversation.lastMessage.text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(fontSize: 14.5),
      ),
      trailing: Text(
        conversation.lastMessage.time,
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}
