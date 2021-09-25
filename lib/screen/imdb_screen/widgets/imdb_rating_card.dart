import 'package:flutter/material.dart';
import 'package:imdb_movie_application/colors.dart';

class ImdbRatingCard extends StatelessWidget {
  final String rating;
  const ImdbRatingCard({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: kDarkBlue.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              "$rating/10",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
