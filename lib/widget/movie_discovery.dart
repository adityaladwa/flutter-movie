import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/widget/movie_detail_widget.dart';

import '../api/api_service_manager.dart';
import '../model/discover_movie.dart';

class MovieDiscoveryWidget extends StatelessWidget {
  final ApiServiceManager apiServiceManager;

  const MovieDiscoveryWidget({required this.apiServiceManager, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Movie Discovery'),
      ),
      body: FutureBuilder(
        future: apiServiceManager.apiService.discoverMovies(),
        builder: (BuildContext context, AsyncSnapshot<DiscoverMovie> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error}"),
            );
          } else {
            return MovieDiscoveryGrid(
                discoverMovie: snapshot.data!,
                apiServiceManager: apiServiceManager);
          }
        },
      ),
    );
  }
}

class MovieDiscoveryGrid extends StatelessWidget {
  final DiscoverMovie discoverMovie;
  final ApiServiceManager apiServiceManager;

  const MovieDiscoveryGrid(
      {super.key,
      required this.discoverMovie,
      required this.apiServiceManager});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 2 / 3,
        ),
        itemCount: discoverMovie.results?.length,
        itemBuilder: (context, index) {
          final movie = discoverMovie.results![index];
          final imageUrl =
              "https://image.tmdb.org/t/p/w200/${movie.posterPath}";
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetailWidget(
                            apiServiceManager: apiServiceManager,
                            movieId: movie.id!,
                          )));
            },
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
