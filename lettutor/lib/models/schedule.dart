class Schedule {
  String tutorId;
  String tutorName;
  String tutorAvatarLink;
  String bookingId;
  String scheduleDetailId;
  String meetingLink;
  String startTime;
  String endTime;
  String date;

  Schedule(
      {required this.bookingId,
      required this.scheduleDetailId,
      required this.tutorId,
      required this.meetingLink,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.tutorName,
      required this.tutorAvatarLink});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
        bookingId: json['id'],
        scheduleDetailId: json['scheduleDetailId'],
        tutorId: json['scheduleDetailInfo']['scheduleInfo']['tutorId'],
        meetingLink: json['studentMeetingLink'],
        date: json['scheduleDetailInfo']['scheduleInfo']['date'],
        startTime: json['scheduleDetailInfo']['scheduleInfo']['startTime'],
        endTime: json['scheduleDetailInfo']['scheduleInfo']['endTime'],
        tutorAvatarLink: json['scheduleDetailInfo']['scheduleInfo']['tutorInfo']
            ['avatar'],
        tutorName: json['scheduleDetailInfo']['scheduleInfo']['tutorInfo']
            ['name']);
  }

  Map<String, dynamic> iDtoJson() {
    List<String> scheduleDetailIds = [];
    scheduleDetailIds.add(scheduleDetailId);
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['scheduleDetailIds'] = scheduleDetailIds;
    return data;
  }
}
