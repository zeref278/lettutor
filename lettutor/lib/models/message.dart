class Message {
  String text;
  MessageType messageType;
  MessageState messageState;
  bool isSender;
  String time;

  Message({
    this.text = '',
    required this.messageState,
    required this.messageType,
    required this.isSender,
    required this.time,
});
}

enum MessageType {text, image}
enum MessageState { notSent, notView, viewed }