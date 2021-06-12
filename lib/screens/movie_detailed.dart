import 'package:flutter/material.dart';

import 'package:megaflixz/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDetailed extends StatefulWidget {
  final MovieModel model;
  const MovieDetailed({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _MovieDetailedState createState() => _MovieDetailedState();
}

class _MovieDetailedState extends State<MovieDetailed> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: Color(0x44000000),
        // bottomOpacity: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${widget.model.imgPath}',
              // height: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.model.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.model.overview),
            ),
            ElevatedButton(
              onPressed: () async {
                List<String>? exList = [];
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                if (sharedPreferences.containsKey('watchLater')) {
                  exList = sharedPreferences.getStringList('watchLater');
                }
                print(exList);

                if (exList != null) {
                  if (exList.contains(widget.model.id.toString())) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Already Added!")));
                  } else {
                    exList.add(widget.model.id.toString());
                    sharedPreferences.setStringList('watchLater', exList);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Succesfully Added!"),
                      ),
                    );
                  }
                }
              },
              child: Text('Add to Watch Later'),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
