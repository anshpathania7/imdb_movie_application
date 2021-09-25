import 'package:flutter/material.dart';

import '../../../colors.dart';

class PlotCard extends StatelessWidget {
  final String? plot;
  final String? directors;
  final String? actors;
  final String? writers;
  const PlotCard(
      {Key? key, this.plot, this.directors, this.actors, this.writers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _directors = directors?.split(",") ?? [];
    final _actors = actors?.split(",") ?? [];
    final _writers = writers?.split(",") ?? [];
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kLightBlue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (plot != null) ...[
                Text(
                  "Plot",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  plot!,
                  style: TextStyle(
                    wordSpacing: 1.2,
                    height: 1.2,
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 22),
              ],
              if (directors != null && directors != "N/A") ...[
                Text(
                  "Director",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  children: [
                    for (int i = 0; i < _directors.length; i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          child: Text(
                            _directors[i].toUpperCase(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ],
                ),
                const SizedBox(height: 40),
              ],
              if (actors != null && actors != "N/A") ...[
                Text(
                  "Actors",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  children: [
                    for (int i = 0; i < _actors.length; i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          child: Text(
                            _actors[i].toUpperCase(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ],
                ),
                const SizedBox(height: 40),
              ],
              if (writers != null && writers != "N/A") ...[
                Text(
                  "Writers",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  children: [
                    for (int i = 0; i < _writers.length; i++) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.07),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 18),
                          child: Text(
                            _writers[i].toUpperCase(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ));
  }
}
