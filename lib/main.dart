import 'package:flutter/material.dart';
import 'package:flutter_movie/movie_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '电影App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MoviePage(),
    );
  }
}
