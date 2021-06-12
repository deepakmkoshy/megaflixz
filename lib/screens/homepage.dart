import 'package:flutter/material.dart';
import 'package:megaflixz/data/tmdb.dart';
import 'package:megaflixz/models/movie.dart';
import 'package:megaflixz/screens/widgets/drawer.dart';
import 'package:megaflixz/screens/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModel> moviesLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Megaflixz'),
        centerTitle: true,
      ),
      drawer: DrawerWid(),
      body: FutureBuilder(
        future: TMDB().getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text(snapshot.error.toString());
          moviesLists = snapshot.data.movieList;
          return GridView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: moviesLists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: 8 / 12),
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(movieModel: moviesLists[index]);
              });
        },
      ),
    );
  }
}
