class Genres {
  final List<Genre> genreList;
  Genres({
    required this.genreList,
  });


  factory Genres.fromJson(List<dynamic> parsedJson) {
    List<Genre> genreList = [];
    genreList = parsedJson.map((i) => Genre.fromJson(i)).toList();

    return Genres(genreList: genreList);
  }
}


class Genre {
  final int id;
  final String name;
  Genre({
    required this.id,
    required this.name,
  });

  

  factory Genre.fromJson(Map<String, dynamic> parsedJson) {
    return Genre(
      id: parsedJson['id'],
      name: parsedJson['name']
        );
  }
}

