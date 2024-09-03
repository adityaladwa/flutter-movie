import 'package:flutter/material.dart';
import 'package:flutter_movie/widget/movie_detail.dart';

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
            return MovieDiscoveryGrid(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget MovieDiscoveryGrid(DiscoverMovie discoverMovie) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: discoverMovie.results?.length,
        itemBuilder: (context, index) {
          final movie = discoverMovie.results![index];
          final imageUrl =
              "https://image.tmdb.org/t/p/w500/${movie.posterPath}";
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetail(
                            apiServiceManager: apiServiceManager,
                            movieId: movie.id!,
                          )));
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
