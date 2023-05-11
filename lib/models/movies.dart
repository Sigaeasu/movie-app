import 'package:equatable/equatable.dart';
import 'package:movieapp/models/genres.dart';
import 'package:movieapp/utils/utils.dart';

// ignore: must_be_immutable
class TVMovies extends Equatable {
  final String id;
  final String title;
  final String overview;
  final String image;
  final String releaseDate;
  final String languange;
  final int voteAverage;
  final int voteCount;
  final double poupularity;
  final int runTime;
  final List<Genres> genres;

  const TVMovies({
    required this.id,
    required this.title,
    required this.overview,
    required this.image,
    required this.releaseDate,
    required this.languange,
    required this.voteAverage,
    required this.voteCount,
    required this.poupularity,
    required this.runTime,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        image,
        releaseDate,
        languange,
        voteAverage,
        voteCount,
        poupularity,
        runTime,
        genres,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': title,
      'overview': overview,
      'image': image,
      'releaseDate': releaseDate,
      'languange': languange,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'poupularity': poupularity,
      'runTime': runTime,
      'genres': genres,
    };
  }

  factory TVMovies.fromMovieJson(Map<String, dynamic> map) {
    return TVMovies(
      id: StringParser.parse(map['id'] ?? ''),
      title: StringParser.parse(map['title'] ?? ''),
      overview: StringParser.parse(map['overview'] ?? ''),
      image: StringParser.parse(map['poster_path'] ?? ''),
      releaseDate: StringParser.parse(map['release_date'] ?? ''),
      languange: StringParser.parse(map['original_languange'] ?? ''),
      voteAverage: NumParser.intParse(map['vote_average'] ?? 0),
      voteCount: NumParser.intParse(map['vote_count'] ?? 0),
      poupularity: NumParser.doubleParse(map['poupularity'] ?? 0.0),
      runTime: NumParser.intParse(map['runtime'] ?? 0),
      genres: ((map['genres'] ?? []) as List)
          .map((e) => Genres.fromJson(e))
          .toList(),
    );
  }

  factory TVMovies.fromTVJson(Map<String, dynamic> map) {
    return TVMovies(
      id: StringParser.parse(map['id'] ?? ''),
      title: StringParser.parse(map['name'] ?? ''),
      overview: StringParser.parse(map['overview'] ?? ''),
      image: StringParser.parse(map['poster_path'] ?? ''),
      releaseDate: StringParser.parse(map['first_air_date'] ?? ''),
      languange: StringParser.parse(map['original_languange'] ?? ''),
      voteAverage: NumParser.intParse(map['vote_average'] ?? 0),
      voteCount: NumParser.intParse(map['vote_count'] ?? 0),
      poupularity: NumParser.doubleParse(map['poupularity'] ?? 0.0),
      runTime: NumParser.intParse(map['runtime'] ?? 0),
      genres: ((map['genres'] ?? []) as List)
          .map((e) => Genres.fromJson(e))
          .toList(),
    );
  }
}
