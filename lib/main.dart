import 'package:flutter/material.dart';

import 'api/api_service_manager.dart';
import 'model/discover_movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiServiceManager apiServiceManager = ApiServiceManager();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MovieDiscoveryWidget(
        apiServiceManager: apiServiceManager,
      ),
    );
  }
}

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
          final imageUrl =
              "https://image.tmdb.org/t/p/w500/${discoverMovie.results![index].posterPath}";
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
          );
        });
  }
}
