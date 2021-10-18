import 'package:lettutor/models/message.dart';
import 'package:lettutor/models/tutor.dart';

class Conversation {
  Tutor tutor;
  Message lastMessage;

  Conversation({
    required this.tutor,
    required this.lastMessage
});

}