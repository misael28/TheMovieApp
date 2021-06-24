import 'package:flutter/material.dart';
import './home/movie_view.dart';
import './details/movie_details_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieDetails()
    );
  }
}

