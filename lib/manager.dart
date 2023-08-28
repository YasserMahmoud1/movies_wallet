import 'package:flutter/material.dart';

class ColorManager {
  static const Color blacks = Color(0xff222831);
  static const Color lightBlacks = Color(0xff393E46);
  static const Color blues = Color(0xff00ADB5);
  static const Color whites = Color(0xffEEEEEE);
}

class GenreManager {
  static const Map<int, String> _genres = {
    0: "Any Genre",
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western",
  };

  static int getGenreByName(String name) {
    return _genres.keys.firstWhere((element) => _genres[element] == name);
  }

  static String getGenreByID(int? id) {
    return _genres[id ?? 0]!;
  }

  static List<String> getGenresValues() {
    return _genres.values.toList();
  }
}

enum SeeMoreModes { trending, popular, nowInTheaters }

class ConstManager {
  static const placeHolderPosterURL =
      "https://craftypixels.com/placeholder-image/500x750/393e46/eeeeee&text=Unavailable+Poster";
  static const posterURlPrefix = "https://image.tmdb.org/t/p/w500";
  static const backdropURlPrefix = "https://image.tmdb.org/t/p/w780";

  static const placeHolderBackdropURL =
      "https://craftypixels.com/placeholder-image/1080x608/393e46/eeeeee&text=Unavailable+Backdrop";

  static const backdropHeightToWidthRation = 9 / 16;
  static const posterHeightToWidthRation = 3 / 2;
  static const double universalBorderRadius = 16;
  static const double genreCardHeight = 32;
  static const double genreCardAllPadding = 4;
  static const double genreCardTextHorizontalPadding = 8;
  static const double homeMovieCardHeight = 240;
  static const double homeMovieCardWidth = 160;
  static const double homeMovieCardRatingPadding = 8;
  static const double universalPadding16 = 16;
  static const double universalPadding8 = 8;
  static const double universalPadding4 = 8;

  static const double movieDetailsPosterHeight = 225;
  static const double movieDetailsPosterWidth = 150;
  static const double movieDetailsCardOpacity = 0.5;
  static const double movieDetailsMovieCardHeight = 187.5;

  static const double movieDetailsMovieCardWidth = 125;
}
