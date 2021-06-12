import 'package:flutter/material.dart';
import 'package:megaflixz/data/genre_api.dart';
import 'package:megaflixz/models/genres.dart';
import 'package:megaflixz/screens/homepage.dart';
import 'package:megaflixz/screens/movie_display.dart';

class DrawerWid extends StatefulWidget {
  const DrawerWid({Key? key}) : super(key: key);

  @override
  _DrawerWidState createState() => _DrawerWidState();
}

class _DrawerWidState extends State<DrawerWid> {
  List<Genre> genre = [];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Text(
              'GENRES',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctxt) => HomePage()));
              },
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    'Trending',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: GenreApi().getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  genre = snapshot.data.genreList;
                  print('LIST: ##########');
                  print(genre);
                  return ListView.builder(
                    itemCount: genre.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctxt) => MovieDisplay(
                                  genreid: genre[index].id,
                                  genreName: genre[index].name)));
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              genre[index].name,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Divider(
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
