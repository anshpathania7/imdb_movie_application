import 'package:flutter/material.dart';
import 'package:imdb_movie_application/screen/imdb_screen/imdb_movie_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imdb api demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImdbMovieScreen(),
    );
  }
}
