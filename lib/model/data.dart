class Data {
  String movieCount;
  String limit;
  String pageNumber;
  List movieData = [];

  Data({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movieData,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        movieCount: json["movie_count"],
        limit: json["limit"],
        pageNumber: json["page_number"],
        movieData: json["movies"]);
  }
}
