
class Movie {
  final String backdropPath;
  final String posterPath;
  final List<int> genreID;
  final int id;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final String title;
  final int numberOfVotes;

  Movie(
      this.backdropPath,
      this.posterPath,
      this.genreID,
      this.id,
      this.overview,
      this.releaseDate,
      this.voteAverage,
      this.title,
      this.numberOfVotes);
  factory Movie.fromJSON(Map<String, dynamic> json) {
    return Movie(
      json['backdrop_path'] ?? '',
      json['poster_path'] ?? '',
      json['genre_ids'] is String ? json['genre_ids'].split(",").map(int.parse).toList().cast<int>()
          : json['genre_ids'].cast<int>(),
      json['id'] ?? 0,
      json['overview'] ?? "", 
      json['release_date'] ?? "",
      (json['vote_average'] ?? 0).toDouble(),
      json['title'] ?? "",
      json["vote_count"] ?? 0,
    );
  }
}
