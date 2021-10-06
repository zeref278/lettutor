import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.grey.withOpacity(0.5),
                margin: const EdgeInsets.only(left: 00.0, right: 10.0),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              )
            ],
          ),
        );
  }

}
