import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/tutor_service.dart';

class TutorProvider with ChangeNotifier {
  List<Tutor> get tutors => _tutors;
  List<Tutor> get searchResults => _searchResults;
  Tutor get tutor => _tutor;

  Tutor _tutor = Tutor(
      id: "",
      name: "",
      bio: "",
      linkAvatar: "",
      rating: 0,
      specialities: [],
      isActivated: false,
      isFavorite: false,
      languages: []);

  final TutorService _tutorService = TutorService.instance;

  final List<Tutor> _tutors = [];
  final List<Tutor> _searchResults = [];

  Future<bool> fetchListTutor(String perPage, String page) async {
    _tutors.clear();
    try {
      List<String> listId = await _tutorService.getListTutor(perPage, page);
      for (int pos = 0; pos < listId.length; pos++) {
        Tutor? tutor = await _tutorService.getTutorById(listId[pos]);
        _tutors.add(tutor!);
      }
      _sort(_tutors);
      notifyListeners();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> searchTutor(String keyWord) async {
    List<Tutor> result = [];
    _searchResults.clear();
    try {
      List<String> listId = await _tutorService.searchTutor(keyWord);
      for (int pos = 0; pos < listId.length; pos++) {
        Tutor? tutor = await _tutorService.getTutorById(listId[pos]);
        _searchResults.add(tutor!);
      }
      _sort(_searchResults);
      notifyListeners();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  void _sort(List<Tutor> tutors) {
    tutors.sort((first, second) =>
    (!first.isFavorite && second.isFavorite) ||
        (first.isFavorite == second.isFavorite && first.rating < second.rating)
        ? 1
        : 0);
  }

  Future<Tutor> fetchTutorInfo(String tutorId) async {
    try {
      _tutor = (await _tutorService.getTutorById(tutorId))!;
      notifyListeners();
      return _tutor;
    } catch (err) {
      rethrow;
    }
  }

  int getTutorById(String tutorId) {
    return _tutors.indexWhere((element) => element.id == tutorId);
  }

  Future<bool> addTutorToFavorite({required String tutorId, String? keyWord}) async {
    try {
      bool result = (await _tutorService.addTutorToFavorite(tutorId));
      await fetchTutorInfo(tutorId);
      await fetchListTutor("4", "1");
      if(keyWord!=null) {
        await searchTutor(keyWord);
      }
      return result;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> reviewTutor(String bookingId, String tutorId, String rating, String content) async {
    try {
      bool result = (await _tutorService.reviewTutor(bookingId, tutorId, rating, content));
      if(result) {
        await fetchTutorInfo(tutorId);
      }

      return result;
    } catch(e) {
      rethrow;
    }
  }
}
