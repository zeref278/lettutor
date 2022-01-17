import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/models/tutor.dart';


class TutorService {
  TutorService._privateConstructor();

  static final TutorService _instance = TutorService._privateConstructor();

  static TutorService get instance => _instance;

  final _tutorApi = TutorApi.instance;

  Future<Tutor?> getTutorById() async {

    try {
      var res = await _tutorApi.getTutorById("4d54d3d7-d2a9-42e5-97a2-5ed38af5789a");

      if (res.statusCode != null && res.statusCode == 200) {
        var jsonRes = jsonDecode(res.toString());
        return Tutor.fromJson(jsonRes);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
  
}
