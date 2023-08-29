import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../manager.dart';

class MovieDetailsMoviePoster extends StatelessWidget {
  const MovieDetailsMoviePoster(this.poster,{
    super.key,
  });

  final String poster;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConstManager.movieDetailsPosterWidth,
      height: ConstManager.movieDetailsPosterHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstManager.universalBorderRadius),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            poster == ''
                ? ConstManager.placeHolderPosterURL
                : "${ConstManager.posterURlPrefix}$poster",
          ),
        ),
      ),
    );
  }
}
