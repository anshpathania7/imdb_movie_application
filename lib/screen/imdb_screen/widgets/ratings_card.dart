import 'package:flutter/material.dart';
import 'package:imdb_movie_application/colors.dart';
import 'package:imdb_movie_application/images.dart';
import 'package:imdb_movie_application/model/imdb_indiviual_data_model.dart';

class RatingsCard extends StatelessWidget {
  final List<Ratings?> ratings;
  final String imdbRating;
  const RatingsCard({Key? key, required this.ratings, required this.imdbRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (int i = 0; i < 5; i++) ...[
                  Image(
                    image: Pngs.star,
                    height: 22,
                    width: 22,
                  ),
                  const SizedBox(width: 8),
                ],
                Spacer(),
                Text(
                  imdbRating,
                  style: TextStyle(
                    fontSize: 24,
                    color: kLightOrange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (int i = 0; i < ratings.length; i++) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        ratings[i]!.source!,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white70,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Text(
                      ratings[i]!.value!,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
