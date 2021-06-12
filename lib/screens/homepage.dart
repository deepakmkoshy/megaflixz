import 'package:flutter/material.dart';
import 'package:megaflixz/data/tmdb.dart';
import 'package:megaflixz/models/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieList? moviesLists;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MegaFlixz'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Text("Drawer will be here"),
      ),
      body: FutureBuilder(
        future: TMDB().getData(),
        // initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text(snapshot.error.toString());
          moviesLists = snapshot.data;
          return GridView.builder(
              itemCount: moviesLists?.movieList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // childAspectRatio: (widt / ht)
              ),
              itemBuilder: (BuildContext context, int index) {
                return Text('d');
              });
        },
      ),
    );
  }
}
