import 'package:flutter/material.dart';

import 'package:megaflixz/models/movie.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;

  const MovieCard({
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16.0),
      // height: 200,
      decoration: BoxDecoration(
        // color: Colors.orange,
        borderRadius: BorderRadius.circular(16.0),
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              movieModel.title,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
