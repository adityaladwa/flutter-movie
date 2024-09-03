import 'package:dio/dio.dart';
import 'package:flutter_movie/api/tmdb_api_service.dart';

class ApiServiceManager {
  static const String TMDB_API_KEY =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhN2NiZGU0YWI0NzRjNzFmMjNlYTcwN2U0NTRlNGI2NCIsIm5iZiI6MTcyNDc3NzAwMy40NzQ4MTcsInN1YiI6IjU2YjFkNmM1OTI1MTQxMjZjYzAwMWVmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.81ZQRFABlEpdYmuk2ocx95UMcwy6M6sJR52SUgaiV5E";
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
