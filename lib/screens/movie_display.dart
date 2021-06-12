import 'package:flutter/material.dart';
import 'package:megaflixz/data/movie_based_on_genre.dart';
import 'package:megaflixz/models/movie.dart';
import 'package:megaflixz/screens/widgets/drawer.dart';
import 'package:megaflixz/screens/widgets/movie_card.dart';

class MovieDisplay extends StatefulWidget {
  final int genreid;
  final String genreName;
  const MovieDisplay({Key? key, required this.genreid, required this.genreName})
      : super(key: key);

  @override
  _MovieDisplayState createState() => _MovieDisplayState();
}

class _MovieDisplayState extends State<MovieDisplay> {
  List<MovieModel> moviesLists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.genreName),
        centerTitle: true,
      ),
      drawer: DrawerWid(),
      body: FutureBuilder(
        future: MovieGenre(genreId: widget.genreid).getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
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
