import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';


class ScheduleService {
  ScheduleService._privateConstructor();

  static final ScheduleService _instance = ScheduleService._privateConstructor();

  static ScheduleService get instance => _instance;

  final _scheduleApi = ScheduleApi.instance;



}
