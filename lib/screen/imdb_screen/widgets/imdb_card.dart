import 'package:flutter/material.dart';
import 'package:imdb_movie_application/colors.dart';
import 'package:imdb_movie_application/provider/imdb_movie_provider.dart';
import 'package:imdb_movie_application/screen/imdb_screen/widgets/imdb_rating_card.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class ImdbCard extends StatelessWidget {
  final String? title;
  final String? imdbID;
  final int indexOfData;
  final String? duration;
  final String? imdbRating;
  final String? poster;

  const ImdbCard(
      {Key? key,
      this.title,
      this.imdbID,
      this.poster,
      this.imdbRating,
      required this.indexOfData,
      this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: OctoImage.fromSet(
                  octoSet: OctoSet.blurHash("LEHV6nWB2yk8pyo0adR*.7kCMdnj"),
                  image: NetworkImage(poster!),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (imdbRating != null)
                Positioned(
                  top: 12,
                  left: 12,
                  child: ImdbRatingCard(rating: imdbRating!),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "Couldn't Load Name",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (duration != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: kLightOrange,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            context
                                .read<ImdbMovieProvider>()
                                .convertMovieRuntimeToHourMinuteFormat(
                                    duration!),
                            style: TextStyle(
                              color: kLightOrange,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
