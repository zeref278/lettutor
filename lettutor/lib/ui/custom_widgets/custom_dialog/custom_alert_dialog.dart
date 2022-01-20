import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'dialog_status.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String description;
  final BasicDialogStatus status;
  final String textMainButton;
  final GestureTapCallback onPressMainButton;
  final String textSecondaryButton;
  final GestureTapCallback onPressSecondaryButton;
  const CustomAlertDialog(
      {Key? key,
        required this.title,
        required this.description,
        required this.status,
        this.textMainButton = "OK",
        required this.onPressMainButton,
        this.textSecondaryButton = "Cancel",
        required this.onPressSecondaryButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      title: Row(
        children: [
          Icon(_getStatusIcon(status), color: _getStatusColor(status), size: 30,),
          Text(title, style: TextStyle(color: _getStatusColor(status), fontSize: 32, fontWeight: FontWeight.w700))
        ],
      ),
      content: Text(description, style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500)),
      actions: [
        MaterialButton(
            onPressed: onPressSecondaryButton,
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              textSecondaryButton,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
        MaterialButton(
            onPressed: onPressMainButton,
            color: defaultPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              textMainButton,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ))
      ],
    );
  }
}


Color _getStatusColor(dynamic customData) {
  switch (customData) {
    case BasicDialogStatus.error:
      return Color(0xfff44336);
    case BasicDialogStatus.warning:
      return Color(0xffff9800);
    default:
      return Color(0xff06864f);
  }
}

IconData _getStatusIcon(dynamic regionDialogStatus) {
  if (regionDialogStatus is BasicDialogStatus)
    switch (regionDialogStatus) {
      case BasicDialogStatus.error:
        return Icons.close;
      case BasicDialogStatus.warning:
        return Icons.warning_amber;
      default:
        return Icons.check;
    }
  else {
    return Icons.check;
  }
}


