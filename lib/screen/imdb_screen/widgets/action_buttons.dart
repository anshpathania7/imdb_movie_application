import 'package:flutter/material.dart';
import 'package:imdb_movie_application/colors.dart';
import 'package:imdb_movie_application/images.dart';

class ActionButtons extends StatelessWidget {
  ActionButtons({Key? key}) : super(key: key);
  final List<AssetImage> _icons = [
    Pngs.arrowDown,
    Pngs.heart,
    Pngs.share,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < _icons.length; i++) ...[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: kLightBlue,
            ),
            padding: const EdgeInsets.all(22),
            child: Image(
              image: _icons[i],
              height: 28,
              width: 28,
            ),
          )
        ]
      ],
    );
  }
}
