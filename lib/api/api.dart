import 'dart:convert';

import 'package:http/http.dart';
import 'package:ytsapp/model/data.dart';
import 'package:ytsapp/model/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  //---->>>>YTS api key
  static const _trendingURL =
      "https://yts.mx/api/v2/list_movies.json?quality=3D";
  //---->>>video api key
  // static const _trendingURL =
  //     "https://api.themoviedb.org/3/trending/movie/day?api_key=86adb317601a330d4301dead4e089dbf";

  Future<List<Data>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingURL));
    print(response.toString());
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['data'];
      print(decodedData);
      return decodedData.map((dat) => Data.fromJson(dat)).toList();
    } else {
      throw Exception(Error());
    }
  }
}
