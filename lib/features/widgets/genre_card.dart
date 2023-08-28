import 'package:flutter/material.dart';

import '../../manager.dart';

class GenreCard extends StatelessWidget {
  const GenreCard(
    this.genre, {
    super.key,
  });

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstManager.genreCardAllPadding),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          height: ConstManager.genreCardHeight,
          decoration: BoxDecoration(
            color: ColorManager.whites,
            borderRadius:
                BorderRadius.circular(ConstManager.universalBorderRadius),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstManager.genreCardTextHorizontalPadding),
              child: Text(
                genre,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ColorManager.blacks),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
