import 'package:dio/dio.dart';
import 'package:imdb_movie_application/model/imdb_data_model.dart';

class ImdbMovieRepository {
  //
  static const api_key = "aa3c64f6";
  static const imdb_url = "http://www.omdbapi.com/?apikey=$api_key";
  static Dio _dio = Dio();

  static Future<ImdbDataModel> getData(
      {required String movieTitle, String page = '1'}) async {
    final request = await _dio
        .get(imdb_url, queryParameters: {'s': movieTitle, 'page': page});
    if (request.statusCode == 200) {
      final data =
          ImdbDataModel.fromJson(Map<String, dynamic>.from(request.data));
      return data;
    } else {
      throw Exception(request.statusMessage);
    }
  }
}
