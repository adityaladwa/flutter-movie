import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie/widget/movie_app.dart';

Future<void> main() async {
  await dotenv.load(fileName: "keys.env");
  runApp(MovieApp());
}
