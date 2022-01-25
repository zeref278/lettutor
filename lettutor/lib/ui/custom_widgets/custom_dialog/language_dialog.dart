import 'package:flutter/material.dart';
import 'package:lettutor/services/language_service.dart';
import 'package:provider/src/provider.dart';

class LanguageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final language = context.watch<LanguageStore>();
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      title: Text('Select language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Image.asset('assets/flags/vn.png',
                  width: 50.0, height: 30.0),
              TextButton(
                  onPressed: () {
                    language.changeLanguage("vi");
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Tiếng Việt',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
          Row(
            children: [
              Image.asset('assets/flags/gb.png',
                  width: 50.0, height: 30.0),
              TextButton(
                  onPressed: () {
                    language.changeLanguage("en");
                    Navigator.pop(context);
                  },
                  child: Text('English',
                      style: TextStyle(fontSize: 18))),
            ],
          ),
        ],
      ),
    );
  }

}