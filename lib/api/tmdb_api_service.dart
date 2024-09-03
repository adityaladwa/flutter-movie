import 'package:dio/dio.dart';
import 'package:flutter_movie/model/discover_movie.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'tmdb_api_service.g.dart'; // Add this line

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class TMDBApiService {
  factory TMDBApiService(Dio dio, {String baseUrl}) = _TMDBApiService;

  @GET("discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")
  Future<DiscoverMovie> discoverMovies();
}
