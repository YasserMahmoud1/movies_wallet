import 'package:flutter/material.dart';

import 'move_details_card_with_obacity.dart';

class MovieDetailsReleaseDate extends StatelessWidget {
  const MovieDetailsReleaseDate({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MovieDetailsCardWithOpacity(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Release Date:",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                releaseDate,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
