import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/tutor_service.dart';


class TutorProvider with ChangeNotifier {
  List<Tutor> get tutors => _tutors;
  Tutor get tutor => _tutor;

  Tutor _tutor = Tutor(
      id: "", name: "", bio: "", linkAvatar: "", rating: 0, specialities: [], isActivated: false, isFavorite: false, languages: []);

  final TutorService _tutorService = TutorService.instance;

  List<Tutor> _tutors = [];

  Future<bool> fetchListTutor(String perPage, String page) async {
    _tutors.clear();
    try {
      List<String> listId = await  _tutorService.getListTutor(perPage, page);
      for(int pos = 0; pos < listId.length; pos++) {
        await fetchTutorInfo(listId[pos]);
        _tutors.add(_tutor);
      }
      notifyListeners();

      return true;
    } catch(e) {
      rethrow;
    }
  }
  

  Future<Tutor> fetchTutorInfo(String tutorId) async {
    try {
      _tutor =  (await _tutorService.getTutorById(tutorId))!;
      notifyListeners();
      return _tutor;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> addTutorToFavorite(String tutorId) async {
    try {
      bool result =  (await _tutorService.addTutorToFavorite(tutorId));
      await fetchTutorInfo(tutorId);
      return result;
    } catch (err) {
      rethrow;
    }
  }

}
