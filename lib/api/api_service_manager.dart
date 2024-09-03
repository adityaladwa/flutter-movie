import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie/api/tmdb_api_service.dart';

class ApiServiceManager {
  final String TMDB_API_KEY = dotenv.env['TMDB_API_KEY']!;

  late final Dio _dio;
  late final TMDBApiService _tmdbApiService;

  ApiServiceManager() {
    _dio = Dio(BaseOptions(
        baseUrl: "https://api.themoviedb.org/3/",
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer $TMDB_API_KEY"
        }));
    _tmdbApiService = TMDBApiService(_dio);
  }

  TMDBApiService get apiService => _tmdbApiService;

  Dio get dio => _dio;
}
