import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class trendingMovieSlider extends StatelessWidget {
  const trendingMovieSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.5,
          pageSnapping: true,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 300,
              width: 200,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
