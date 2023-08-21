import 'package:flutter/material.dart';

import '../../manager.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.genre,
  });
  final String genre;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: ColorManager.whites,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
