import 'package:flutter/material.dart';
import 'package:flutter_movie/api/api_service_manager.dart';

class MovieDetailWidget extends StatelessWidget {
  final ApiServiceManager apiServiceManager;
  final num movieId;

  const MovieDetailWidget(
      {required this.apiServiceManager, required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie Detail'),
      ),
      body: Center(
        child: Text('Movie Detail for $movieId'),
      ),
    );
  }
}
