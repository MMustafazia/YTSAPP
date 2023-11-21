import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ytsapp/api/api.dart';
import 'package:ytsapp/model/data.dart';
import 'package:ytsapp/model/movies.dart';
import 'package:ytsapp/widgets/constants.dart';
import 'package:ytsapp/widgets/topratedMovie.dart';
import 'package:ytsapp/widgets/trendingMovieSlider.dart';
import 'package:ytsapp/widgets/upcomingmovieBuilder.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Data>> trendingMovies;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Trending',
                  style: GoogleFonts.aBeeZee(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            trendingMovieSlider(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Top Rated',
                  style: GoogleFonts.aBeeZee(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            topratedMovieBuilder(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Upcoming Movies',
                  style: GoogleFonts.aBeeZee(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            upcomingMovieBuilder()
          ],
        ),
      ),
    );
  }
}
