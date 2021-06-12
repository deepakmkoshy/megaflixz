import 'package:flutter/material.dart';
import 'package:megaflixz/data/tmdb.dart';
import 'package:megaflixz/models/movie.dart';
import 'package:megaflixz/screens/watch_later.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctxt) => WatchLater()));
              },
              icon: Icon(Icons.movie))
        ],
        centerTitle: true,
      ),
      drawer: DrawerWid(),
      body: FutureBuilder(
        future: TMDB().getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          moviesLists = snapshot.data.movieList;
          return GridView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: moviesLists.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: 7.5 / 12),
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(movieModel: moviesLists[index]);
              });
        },
      ),
    );
  }
}
