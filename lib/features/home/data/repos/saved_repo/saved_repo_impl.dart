import 'package:movies_wallet/features/home/data/repos/saved_repo/saved_repo.dart';
import 'package:movies_wallet/features/movie_details/data/models/movie_model.dart';

import '../../../../../core/utils/database_service.dart';

class SavedRepoImpl implements SavedRepo {

  final DatabaseService databaseService;

  SavedRepoImpl(this.databaseService);

  @override
  Future<List<Movie>> getSavedMovies() async {
    final db = await databaseService.db;
    final result = await db.rawQuery("""
      SELECT
          m.*,
          GROUP_CONCAT(g.genre_id)  AS genre_ids
      FROM
          movies m
      LEFT JOIN
          genres g ON m.id = g.movie_id
	    GROUP BY
		    m.id;

    """);
    // if (result[0]["movie_id"] == null) {
    //   return [];
    // }
    return result.map<Movie>((movie) {
      // final genreIDs = movie["genre_ids"]
      //     .toString()
      //     .replaceAll("[", "")
      //     .replaceAll("]", "")
      //     .split(",");
      return Movie.fromJSON(movie);
    }).toList();
  }

  @override
  Future<void> deleteMovie(int movieID) async {
    final db = await databaseService.db;

    await db.rawDelete("""
      DELETE FROM movies
      WHERE id = $movieID;
    """);

    await db.rawDelete("""
      DELETE FROM genres
      WHERE movie_id = $movieID;
    """);
  }

  @override
  Future<void> saveMovie(Movie movie) async {
    final db = await databaseService.db;
    await db.rawInsert("""
      INSERT INTO movies(
        id,
        title,
        overview,
        poster_path,
        backdrop_path,
        vote_average,
        release_date,
        vote_count
      ) VALUES(
        ${movie.id},
        "${movie.title}",
        "${movie.overview}",
        "${movie.posterPath}",
        "${movie.backdropPath}",
        ${movie.voteAverage},
        "${movie.releaseDate}",
        ${movie.numberOfVotes}
      );
    """);

    for (var genre in movie.genreID) {
      await db.rawInsert("""
        INSERT INTO genres(
          genre_id,
          movie_id
        ) VALUES(
          $genre,
          ${movie.id}
        );
      """);
    }
  }

  @override
  Future<bool> isSaved(int movieID) async {
    final db = await databaseService.db;
    final result = await db.rawQuery("""
      SELECT EXISTS(
        SELECT 1
        FROM movies
        WHERE id = $movieID
      ) AS exp;
    """);
    return result[0]["exp"] == 1;
  }
}
