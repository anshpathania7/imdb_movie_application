import 'package:dio/dio.dart';
import 'package:imdb_movie_application/model/imdb_data_model.dart';
import 'package:imdb_movie_application/model/imdb_indiviual_data_model.dart';

class ImdbMovieRepository {
  //
  static const api_key = "aa3c64f6";
  static const imdb_url = "http://www.omdbapi.com/?apikey=$api_key";
  static Dio _dio = Dio();

  static Future<List<ImdbIndividualModel>> getData(
      {required String movieTitle, String page = '1'}) async {
    final request = await _dio
        .get(imdb_url, queryParameters: {'s': movieTitle, 'page': page});
    if (request.statusCode == 200) {
      final data =
          ImdbDataModel.fromJson(Map<String, dynamic>.from(request.data));
      final imdbModels = List<ImdbIndividualModel>.empty(growable: true);
      final moveiObjects = data.search!;
      await Future.forEach(moveiObjects, (Search? v) async {
        if (v != null && v.imdbID != null) {
          final detailedData =
              await getDetailedDataForThisMovie(imdbId: v.imdbID!);
          imdbModels.add(detailedData);
        }
      });
      return imdbModels;
    } else {
      throw Exception(request.statusMessage);
    }
  }

  static Future<ImdbIndividualModel> getDetailedDataForThisMovie(
      {required String imdbId}) async {
    final request = await _dio
        .get(imdb_url, queryParameters: {'i': imdbId, 'plot': 'full'});
    if (request.statusCode == 200) {
      final data =
          ImdbIndividualModel.fromJson(Map<String, dynamic>.from(request.data));
      return data;
    } else {
      throw Exception(request.statusMessage);
    }
  }
}
