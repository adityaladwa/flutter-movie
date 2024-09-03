import 'package:flutter/material.dart';
import 'package:flutter_movie/api/api_service_manager.dart';

class MovieDetail extends StatelessWidget {
  final ApiServiceManager apiServiceManager;
  final num movieId;

  const MovieDetail(
      {required this.apiServiceManager, required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: const Center(
        child: Text('Movie Detail'),
      ),
    );
  }
}
