import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/api/api_service_manager.dart';
import 'package:flutter_movie/model/movie_detail.dart';

class MovieDetailWidget extends StatelessWidget {
  final ApiServiceManager apiServiceManager;
  final num movieId;

  const MovieDetailWidget(
      {required this.apiServiceManager, required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
        title: const Text('Movie Detail'),
      ),
      body: FutureBuilder<MovieDetail>(
          future: apiServiceManager.apiService.movieDetail(movieId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return MovieDetailScreen(snapshot.data!);
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final MovieDetail movieDetail;

  const MovieDetailScreen(this.movieDetail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl:
              'https://image.tmdb.org/t/p/w500${movieDetail.backdropPath}',
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        Text(
          movieDetail.title!,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          movieDetail.overview!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(movieDetail.releaseDate!,
            style: Theme.of(context).textTheme.headlineLarge),
        Text(
          movieDetail.voteAverage.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
