import 'package:flutter/foundation.dart';
import 'package:imdb_movie_application/model/imdb_indiviual_data_model.dart';
import 'package:imdb_movie_application/repository/imdb_movie_repository.dart';

class ImdbMovieProvider extends ChangeNotifier {
  bool isLoadingData;
  bool hasSuccessfullyLoadedData;
  int _loadPageNumber;
  late String? _currentMovieTitle;
  bool isIntial;
  List<ImdbIndividualModel> imdbData;

  ImdbMovieProvider()
      : isLoadingData = false,
        _loadPageNumber = 1,
        isIntial = true,
        imdbData = List.empty(growable: true),
        hasSuccessfullyLoadedData = false;

  set _updateLoadingState(bool v) {
    isLoadingData = v;
    notifyListeners();
  }

  set _updateHasSuccessfullyLoadedData(bool v) {
    hasSuccessfullyLoadedData = v;
    notifyListeners();
  }

  String convertMovieRuntimeToHourMinuteFormat(String runtime) {
    final arr = runtime.split(' ');
    if (arr.last == 'min' && arr.length == 2) {
      int timeInMinutes = int.parse(arr.first);
      if (timeInMinutes <= 60) {
        return "$timeInMinutes minute";
      }
      int hh = timeInMinutes ~/ 60;
      int mm = timeInMinutes - (hh * 60);
      if (hh == 1) {
        return "$hh hour $mm minute";
      } else {
        return "$hh hours $mm minute";
      }
    } else {
      return runtime;
    }
  }

  Future<bool> loadMoreData() async {
    try {
      if (_currentMovieTitle == null) return false;
      _loadPageNumber += 1;
      final data = await ImdbMovieRepository.getData(
          movieTitle: _currentMovieTitle!, page: _loadPageNumber.toString());

      imdbData.addAll(data);
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      print(e);
      return false;
    }
  }

  set _updateifIntial(bool v) {
    isIntial = v;
    notifyListeners();
  }

  Future<void> getDataForThisMovie({required String movieTitle}) async {
    _updateLoadingState = true;
    if (isIntial) _updateifIntial = false;
    try {
      final data = await ImdbMovieRepository.getData(movieTitle: movieTitle);

      _currentMovieTitle = movieTitle;
      _loadPageNumber = 1;
      imdbData.clear();
      imdbData.addAll(data);
      print(data.length);
    } catch (e) {
      _updateHasSuccessfullyLoadedData = false;
    } finally {
      _updateLoadingState = false;
      notifyListeners();
    }
  }
}
