import '../../../actor_details/data/models/actor_model.dart';

class Movie {
  final String backdropPath;
  final String posterPath;
  final List<int> genreID;
  final int id;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final String title;
  final String? trailerID;
  final List<Movie>? recommendedMovies;
  final List<Actor>? credits;

  Movie(this.backdropPath, this.posterPath, this.genreID, this.id, this.overview, this.releaseDate, this.voteAverage, this.title, this.trailerID, this.recommendedMovies, this.credits);

  factory Movie.fromJSON(Map<String, dynamic> json) {
    return Movie(
      json['backdrop_path'] ?? '',
      json['poster_path'] ?? '',
      json['genre_ids'].cast<int>(),
      json['id'],
      json['overview'],
      json['release_date'],
      json['vote_average'].toDouble(),
      json['title'],
      json['trailer_id'],
      null,
      null,
    );
  }

  
}
