import 'package:flutter/material.dart';

import '../../features/movie_details/data/models/movie_model.dart';
import '../../features/movie_details/presentation/view/movie_details_view.dart';

void goToMovieDetails(BuildContext context, Movie movie) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) =>  MovieDetailsView(movie)));
}