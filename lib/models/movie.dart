class MovieList {
  final List<MovieModel> movieList;

  MovieList({required this.movieList});

  factory MovieList.fromJson(List<dynamic> parsedJson) {
    List<MovieModel> movies = [];
    movies = parsedJson.map((i) => MovieModel.fromJson(i)).toList();

    return MovieList(movieList: movies);
  }
}

class MovieModel {
  final String title;
  final String overview;
  final String imgPath;
  final int id;
  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.imgPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> parsedJson) {

    return MovieModel(
        title: parsedJson['original_title'],
        overview: parsedJson['overview'],
        imgPath:
            parsedJson['poster_path'] ?? '/q719jXXEzOoYaps6babgKnONONX.jpg',
        id: parsedJson['id']);
  }
}
