import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/parser_service.dart';


class TutorService {
  TutorService._privateConstructor();

  static final TutorService _instance = TutorService._privateConstructor();

  static TutorService get instance => _instance;

  final _tutorApi = TutorApi.instance;

  Future<Tutor?> getTutorById(String tutorId) async {

    try {
      var res = await _tutorApi.getTutorById(tutorId);

      if (res.statusCode != null && res.statusCode == 200) {
        var jsonRes = jsonDecode(res.toString());
        return Tutor.fromJson(jsonRes);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> searchTutor(String keyWord) async {
    List<String> result;

    try {
      var res = await _tutorApi.searchTutor(keyWord);
      result = ParserService.parseSearchResult(res.toString());

      return result;
    } catch(e) {
      rethrow;
    }
  }

  Future<bool> reviewTutor(String bookingId, String tutorId, String rating, String content) async {

    try {
      var res = await _tutorApi.reviewTutor(bookingId, tutorId, rating, content);
      if (res.statusCode != null && res.statusCode == 200) {
        return true;
      }

      return false;

    } catch(e) {
      rethrow;
    }
  }

  Future<List<String>> getListTutor(String perPage, String page) async {
    List<String> result;

    try {
      var res = await _tutorApi.getListTutor(perPage, page);
      result = ParserService.parseListTutor(res.toString());

      return result;
    } catch(e) {
      rethrow;
    }
  }

  Future<bool> addTutorToFavorite(String tutorId) async {
    try {
      var res = await _tutorApi.addTutorToFavorite(tutorId);
      if (res.statusCode != null && res.statusCode == 200) {
        return true;
      }
    } catch(e) {
      rethrow;
    }

    return false;
  }
  
}
