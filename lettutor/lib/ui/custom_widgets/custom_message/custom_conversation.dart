import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';

class CustomConversation extends StatelessWidget {
  final Tutor tutor;

  const CustomConversation({Key? key, required this.tutor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(tutor.linkAvatar),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 2)),
            ),
          )
        ],
      ),
      title: Text(
        tutor.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'You: See you on Sunday, good night teacher',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(fontSize: 14.5),
      ),
      trailing: Text(
        '06-11-21 11:16 PM',
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}
