import 'package:flutter/material.dart';

class upcomingMovieBuilder extends StatelessWidget {
  const upcomingMovieBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: EdgeInsets.only(right: 5, left: 5),
              height: 200,
              width: 150,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
