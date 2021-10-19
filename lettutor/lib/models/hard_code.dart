import 'course.dart';
import 'message.dart';
import 'tutor.dart';

List messages = [
  Message(
      text: "Hi Deepa 😀",
      messageType: MessageType.text,
      messageState: MessageState.viewed,
      isSender: false,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "Did you prepare the report??",
      messageType: MessageType.text,
      messageState: MessageState.viewed,
      isSender: false,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "yea,just bit of docs left😅",
      messageType: MessageType.text,
      messageState: MessageState.viewed,
      isSender: true,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "oh great👍 ",
      messageType: MessageType.text,
      messageState: MessageState.notSent,
      isSender: false,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "arrange a meet asap pls",
      messageType: MessageType.text,
      messageState: MessageState.notSent,
      isSender: false,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "wat bout 6'30 PM today🤔",
      messageType: MessageType.text,
      messageState: MessageState.viewed,
      isSender: true,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "sounds cool",
      messageType: MessageType.text,
      messageState: MessageState.viewed,
      isSender: false,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "Hope u'll like it 😌",
      messageType: MessageType.text,
      messageState: MessageState.viewed,
      isSender: true,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "haha!sure😁",
      messageType: MessageType.text,
      messageState: MessageState.viewed,
      isSender: false,
      time: '2021-10-18 04:25 PM'),
  Message(
      text: "And check this too",
      messageType: MessageType.text,
      messageState: MessageState.notView,
      isSender: true,
      time: '2021-10-18 04:25 PM'),
];

Tutor myTutor = Tutor(
  name: 'Duy Truong',
  linkAvatar: 'assets/avatar.jpg',
  specialities: 'English for kid',
  description:
      "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. I am an outgoing person and I have this passion for dealing with different people and seeing them progress with my help as their teacher. In fact, making friends is one of my best skills. I am very good at adapting to new environments and new situations. I am very friendly and can easily get along well with everyone. I have obtained a 120-Hour TEFL Certificate. I get a variety of teaching techniques. I know that there are fast and not so fast learners. So don't worry, I will be with you every step of the way going at your own pace. Let's practice what you already know and add something new each day. With my skills and experiences, I can assure you that I can provide adequate English learning effectively and efficiently. Together, let's make English learning fun.",
);
Course myCourse = Course(
  name: 'Basic Conversation Topics',
  shortDescription: 'Gain confidence speaking about familiar topics',
  level: 'Beginner',
  courseLength: 10,
  firstOverview:
      "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
  secondOverview:
      "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
  linkImageCover: 'assets/course.png',
);

List listSpecialities = ['English for kid', 'TOEIC', 'IELTS', 'VNU-EPT'];
