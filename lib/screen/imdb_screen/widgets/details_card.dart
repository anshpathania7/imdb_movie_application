import 'package:flutter/material.dart';
import 'package:imdb_movie_application/images.dart';

import '../../../colors.dart';

class DetailsCard extends StatelessWidget {
  final String? year;
  final String? location;
  final String? duration;
  final String? language;
  const DetailsCard(
      {Key? key, this.year, this.location, this.duration, this.language})
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
              if (year != null) _RowWidget(image: Pngs.calendar, text: year!),
              if (location != null)
                _RowWidget(image: Pngs.earth, text: location!),
              if (duration != null)
                _RowWidget(image: Pngs.time, text: duration!),
              if (language != null)
                _RowWidget(image: Pngs.sound, text: language!),
            ],
          ),
        ));
  }
}

class _RowWidget extends StatelessWidget {
  final AssetImage image;
  final String text;
  const _RowWidget({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 22),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 22,
              ),
            ),
          )
        ],
      ),
    );
  }
}
