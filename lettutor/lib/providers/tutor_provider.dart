import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/tutor_service.dart';


class TutorProvider with ChangeNotifier {
  Tutor get tutor => _tutor;

  Tutor _tutor = Tutor(
      id: "", name: "", bio: "", linkAvatar: "", rating: 0, specialities: "", isActivated: false, isFavorite: false);

  final TutorService _tutorService = TutorService.instance;

  Future<bool> fetchTutorInfo() async {
    try {
      _tutor =  (await _tutorService.getTutorById())!;
      print(_tutor.id);
      notifyListeners();
      return true;
    } catch (err) {
      rethrow;
    }
  }

}
