import 'package:flutter/material.dart';
import 'package:movies_wallet/features/widgets/rating_widget.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard({
    super.key,
    required this.poster,
    required this.actorName,
    required this.isMovie,
    this.actorRole,
    this.rating,
  });

  final String poster;
  final String actorName;
  final String? actorRole;
  final bool isMovie;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 187.5,
              width: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                    poster,
                  ),
                ),
              ),
            ),
            if (isMovie)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Rating(rating ?? 0),
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8, bottom: 4),
          child: SizedBox(
            width: 125,
            child: Text(
              actorName,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (!isMovie)
          Text("(${actorRole ?? " "})",
              style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
