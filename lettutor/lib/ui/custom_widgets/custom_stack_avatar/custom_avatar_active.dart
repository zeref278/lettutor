import 'package:flutter/material.dart';

class CustomAvatarActive extends StatelessWidget {
  final int avatarSize;
  final ImageProvider avatar;
  final bool isActive;

  const CustomAvatarActive(
      {Key? key,
      this.avatarSize = 25,
      required this.avatar,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 25,
          backgroundImage: avatar,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2)),
          ),
        )
      ],
    );
  }
}
