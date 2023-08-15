import 'package:flutter/material.dart';

class ColorManager {
  static const Color blacks = Color(0xff222831);
  static const Color lightBlacks = Color(0xff393E46);
  static const Color blues = Color(0xff00ADB5);
  static const Color whites = Color(0xffEEEEEE);
}

class GenreManager {
  static const Map<int, String> _genres = {
    0:"Any",
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
    return _genres[id ?? 0] !;
  }

  static List<String> getGenresValues() {
    return _genres.values.toList();
  }
}


enum SeeMoreModes{
  trending,
  popular,
  nowInTheaters
}