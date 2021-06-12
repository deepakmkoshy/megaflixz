import 'package:flutter/material.dart';
import 'package:megaflixz/data/movie_by_id.dart';
import 'package:megaflixz/models/movie.dart';
import 'package:megaflixz/screens/widgets/movie_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchLater extends StatefulWidget {
  const WatchLater({Key? key}) : super(key: key);

  @override
  _WatchLaterState createState() => _WatchLaterState();
}

class _WatchLaterState extends State<WatchLater> {
  List<MovieModel> moviesLists = [];

  Future getInst() async {
    List<String>? exList = [];

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('watchLater')) {
      exList = sharedPreferences.getStringList('watchLater');
      return exList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Watch Later'), centerTitle: true),
      body: FutureBuilder(
        future: getInst(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if (snapshot.data.isEmpty) {
            return Center(
              child: Text(
                'It\'s empty in here!',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          List<String> idList = snapshot.data;

          return FutureBuilder(
            future: MovieIdList(movieIdList: idList).getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              moviesLists = snapshot.data;

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
                },
              );
            },
          );
        },
      ),
    );
  }
}
