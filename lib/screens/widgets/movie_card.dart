import 'package:flutter/material.dart';

import 'package:megaflixz/models/movie.dart';
import 'package:megaflixz/screens/movie_detailed.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;

  const MovieCard({
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctxt) => MovieDetailed(model: movieModel,)));
              
      },
      // padding: EdgeInsets.all(16.0),
      // height: 300,
      // decoration: BoxDecoration(
      //   // color: Colors.orange,
      //   borderRadius: BorderRadius.circular(16.0),
      // ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movieModel.imgPath}',
              height: 200,
              // fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 4.0, 0, 0),
            child: Text(
              movieModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
