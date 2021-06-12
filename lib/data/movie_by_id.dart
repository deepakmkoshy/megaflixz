import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaflixz/models/movie.dart';

// void main() {
//   MovieIdList().getData();
// }

class MovieById {
  final int movieId;
  MovieById({
    required this.movieId,
  });

  Future<MovieModel> getData() async {
    String url =
        'https://api.themoviedb.org/3/movie/$movieId?api_key=997dd0df126bf7546140928361df293f';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      dynamic data = response.body;
      dynamic json = jsonDecode(data);
      MovieModel model = MovieModel.fromJson(json);
      // print(model);
      return model;
    }
    else
    return MovieModel(id: 25, title: 'This should not be happening', overview: 'Nah', imgPath: '/q719jXXEzOoYaps6babgKnONONX.jpg');
  }
}

class MovieIdList {
  final List<String> movieIdList;

  MovieIdList({required this.movieIdList});

  Future getData() async {
    List<Future<MovieModel>> futures = [];
    movieIdList.forEach((element) async {
      int id = int.parse(element);
      futures.add(MovieById(movieId: id).getData());
      // movieModel.add(model);
      // MovieById(movieId: id).getData().then((value) => movieModel.add(value));
    });
    List<MovieModel> value = await Future.wait(futures);

    return value;
    // return movieModel;

    // print(movieModel);
  }
}
