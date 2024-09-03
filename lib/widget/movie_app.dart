import 'package:flutter/material.dart';

import '../api/api_service_manager.dart';
import 'movie_discovery.dart';

class MovieApp extends StatelessWidget {
  final ApiServiceManager apiServiceManager = ApiServiceManager();

  MovieApp({super.key});

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
