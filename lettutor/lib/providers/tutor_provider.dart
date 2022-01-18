import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/tutor_service.dart';


class TutorProvider with ChangeNotifier {
  Tutor get tutor => _tutor;

  Tutor _tutor = Tutor(
      id: "", name: "", bio: "", linkAvatar: "", rating: 0, specialities: [], isActivated: false, isFavorite: false, languages: []);

  final TutorService _tutorService = TutorService.instance;

  Future<bool> fetchTutorInfo() async {
    try {
      _tutor =  (await _tutorService.getTutorById("4d54d3d7-d2a9-42e5-97a2-5ed38af5789a"))!;
      notifyListeners();
      return true;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> addTutorToFavorite() async {
    try {
      bool result =  (await _tutorService.addTutorToFavorite("4d54d3d7-d2a9-42e5-97a2-5ed38af5789a"));
      await fetchTutorInfo();
      return result;
    } catch (err) {
      rethrow;
    }
  }

}
