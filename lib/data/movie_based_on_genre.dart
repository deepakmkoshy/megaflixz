import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:megaflixz/models/movie.dart';

// void main() {
//   MovieGenre(genreId: 28).getData();
// }

class MovieGenre {
  final int genreId;
  String url =
      'https://api.themoviedb.org/3/discover/movie?api_key=997dd0df126bf7546140928361df293f&with_genres=';
  MovieGenre({
    required this.genreId,
  });

  Future getData() async {
    http.Response response =
        await http.get(Uri.parse(url + genreId.toString()));
    if (response.statusCode == 200) {
      dynamic data = response.body;
      dynamic json = jsonDecode(data);
      MovieList model = MovieList.fromJson(json['results']);

      return model;
      // print(json['results'][0]['original_language']);
    }
  }
}
