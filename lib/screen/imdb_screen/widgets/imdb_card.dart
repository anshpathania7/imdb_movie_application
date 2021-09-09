import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class ImdbCard extends StatelessWidget {
  final String? title;
  final String? year;
  final String? imdbID;
  final String? type;
  final String? poster;

  const ImdbCard(
      {Key? key, this.title, this.year, this.imdbID, this.type, this.poster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        elevation: 12,
        shadowColor: Colors.blueGrey[100],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: OctoImage.fromSet(
                  octoSet: OctoSet.blurHash("LEHV6nWB2yk8pyo0adR*.7kCMdnj"),
                  image: NetworkImage(poster!),
                  height: 150,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "Couldn't Load Name",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (type != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          type!,
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    if (year != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 2),
                            child: Text(
                              year!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
