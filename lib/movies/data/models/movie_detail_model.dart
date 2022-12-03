import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({required List<Genres> genres,
    required String backdropPath,
    required int id,
    required String overview,
    required String releaseDate,
    required int runTime,
    required String title,
    required String voteAverage})
      : super(
      genres: genres,
      backdropPath: backdropPath,
      id: id,
      overview: overview,
      releaseDate: releaseDate,
      runTime: runTime,
      title: title,
      voteAverage: voteAverage);

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
          genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
          backdropPath: json['backdrop_path'],
          id: json['id'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          runTime: json['runtime'],
          title: json['title'],
          voteAverage: json['vote_average']);
}
