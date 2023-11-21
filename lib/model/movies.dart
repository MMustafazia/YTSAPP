// class Movie {
//   String title;
//   String backDropPath;
//   String originalTitle;
//   String overview;
//   String posterPath;
//   String releaseDate;
//   String voteAverage;

//   Movie({
//     required this.title,
//     required this.backDropPath,
//     required this.originalTitle,
//     required this.overview,
//     required this.posterPath,
//     required this.releaseDate,
//     required this.voteAverage,
//   });
//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       title: json["title"],
//       backDropPath: json["backdrop_path"],
//       originalTitle: json["original_path"],
//       overview: json["overview"],
//       posterPath: json["poster_path"],
//       releaseDate: json["release_date"],
//       voteAverage: json["vote_average"],
//     );
//   }
// }

class Movie {
  String title;
  String titleLong;
  String year;
  String rating;
  String url;
  String summary;
  String originalBackgroundImage;
  String backgroundImage;
  String imdbcode;

  Movie({
    required this.title,
    required this.titleLong,
    required this.year,
    required this.rating,
    required this.url,
    required this.summary,
    required this.originalBackgroundImage,
    required this.backgroundImage,
    required this.imdbcode,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        titleLong: json["title_long"],
        year: json["year"],
        rating: json["rating"],
        url: json["url"],
        summary: json["summary"],
        originalBackgroundImage: json["background_image_original"],
        backgroundImage: json["background_image"],
        imdbcode: json["imdb_co"]);
  }
}
