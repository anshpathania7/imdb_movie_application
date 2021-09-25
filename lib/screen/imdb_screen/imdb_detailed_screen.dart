import 'package:flutter/material.dart';
import 'package:imdb_movie_application/colors.dart';
import 'package:imdb_movie_application/images.dart';

import 'package:imdb_movie_application/model/imdb_indiviual_data_model.dart';
import 'package:imdb_movie_application/screen/imdb_screen/widgets/action_buttons.dart';
import 'package:imdb_movie_application/screen/imdb_screen/widgets/details_card.dart';
import 'package:imdb_movie_application/screen/imdb_screen/widgets/plot_card.dart';
import 'package:imdb_movie_application/screen/imdb_screen/widgets/ratings_card.dart';
import 'package:octo_image/octo_image.dart';

class ImdbDetailedScreen extends StatelessWidget {
  final ImdbIndividualModel data;
  const ImdbDetailedScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        kDarkBlue.withOpacity(0.6),
                        kDarkBlue.withOpacity(0.2),
                        kDarkBlue.withOpacity(0.4),
                        kDarkBlue.withOpacity(0.5),
                        kDarkBlue.withOpacity(0.7),
                        kDarkBlue.withOpacity(0.9),
                        kDarkBlue.withOpacity(1),
                        kDarkBlue,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: OctoImage.fromSet(
                    octoSet: OctoSet.blurHash("LEHV6nWB2yk8pyo0adR*.7kCMdnj"),
                    image: NetworkImage(data.poster!),
                    filterQuality: FilterQuality.high,
                    height: 0.8 * sh,
                    width: sw,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 40,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.22),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image(
                        image: Pngs.back,
                        height: 44,
                        width: 44,
                      ),
                    ),
                  ),
                ),
                if (data.title != null)
                  Positioned(
                    bottom: 140,
                    left: 0.12 * sw,
                    width: 0.78 * sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.title!,
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.8,
                            fontSize: 50,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (data.genre != null)
                          Text(
                            data.genre!,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                      ],
                    ),
                  ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: ActionButtons(),
                  ),
                ),
              ],
            ),
            if (data.ratings != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
                child: RatingsCard(
                  ratings: data.ratings!,
                  imdbRating: data.imdbRating ?? "N.A",
                ),
              ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
              child: DetailsCard(
                year: data.year,
                location: data.country,
                duration: data.runtime,
                language: data.language,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
              child: PlotCard(
                plot: data.plot,
                directors: data.director,
                actors: data.actors,
                writers: data.writer,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
