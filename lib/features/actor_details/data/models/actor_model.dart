import '../../../movie_details/data/models/movie_model.dart';

class Actor
{
  final int id;
  final String name;
  final String profilePathID;
  final String character;
  final List<Movie>? movies;

  Actor(this.id, this.name, this.profilePathID, this.character, this.movies);

  factory Actor.fromJSON(Map<String, dynamic> json)
  {
    return Actor(
      json['id'],
      json['name'],
      json['profile_path'] ?? '',
      json['character'],
      null,
    );
  }

}