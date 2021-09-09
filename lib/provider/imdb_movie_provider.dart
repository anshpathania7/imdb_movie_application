import 'package:flutter/foundation.dart';
import 'package:imdb_movie_application/model/imdb_data_model.dart';
import 'package:imdb_movie_application/repository/imdb_movie_repository.dart';

class ImdbMovieProvider extends ChangeNotifier {
  bool isLoadingData;
  bool hasSuccessfullyLoadedData;
  int _loadPageNumber;
  late String? _currentMovieTitle;
  ImdbDataModel? movieData;
  bool isIntial;

  ImdbMovieProvider()
      : isLoadingData = false,
        _loadPageNumber = 1,
        isIntial = true,
        movieData = null,
        hasSuccessfullyLoadedData = false;

  set _updateLoadingState(bool v) {
    isLoadingData = v;
    notifyListeners();
  }

  set _updateHasSuccessfullyLoadedData(bool v) {
    hasSuccessfullyLoadedData = v;
    notifyListeners();
  }

  Future<bool> loadMoreData() async {
    try {
      if (_currentMovieTitle == null) return false;
      _loadPageNumber += 1;
      final data = await ImdbMovieRepository.getData(
          movieTitle: _currentMovieTitle!, page: _loadPageNumber.toString());
      movieData?.search?.addAll(data.search!);
      movieData?.response = data.response;

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
    movieData = null;
    if (isIntial) _updateifIntial = false;
    try {
      final data = await ImdbMovieRepository.getData(movieTitle: movieTitle);
      _currentMovieTitle = movieTitle;
      _loadPageNumber = 1;
      movieData = data;
      print(data.totalResults);
    } catch (e) {
      _updateHasSuccessfullyLoadedData = false;
    } finally {
      _updateLoadingState = false;
      notifyListeners();
    }
  }
}
