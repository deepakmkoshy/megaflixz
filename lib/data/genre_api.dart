import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaflixz/models/genres.dart';
import 'package:megaflixz/models/movie.dart';

// void main() {
//   GenreApi().getData();
// }

class GenreApi {
  // GenreApi();

  Future getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=997dd0df126bf7546140928361df293f'));
    if (response.statusCode == 200) {
      dynamic data = response.body;
      dynamic json = jsonDecode(data);
      Genres model = Genres.fromJson(json['genres']);
      return model;
      // print(model.genreList[3].name);
    }
  }
}
