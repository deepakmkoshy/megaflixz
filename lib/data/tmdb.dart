import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaflixz/models/movie.dart';

// void main() {
//   TMDB().getData();
// }

class TMDB {
  final String url;

  TMDB(
      {this.url =
          'https://api.themoviedb.org/3/trending/movie/day?api_key=997dd0df126bf7546140928361df293f'});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic data = response.body;
      dynamic json = jsonDecode(data);
      MovieList model = MovieList.fromJson(json['results']);
      print(model.movieList.length);
      return model;
      // print(json['results'][0]['original_language']);
    }
  }
}
