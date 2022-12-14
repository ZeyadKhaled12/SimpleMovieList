import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required int id,
    required String releaseDate,
    required String title,
    required String backdropPath,
    required List<int> genreIds,
    required String overview,
    required double voteAverage})
      : super(
      id: id,
      releaseDate: releaseDate,
      title: title,
      backdropPath: backdropPath,
      genreIds: genreIds,
      overview: overview,
      voteAverage: voteAverage);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      MovieModel(
          id: json['id'],
          releaseDate: json['release_date'],
          title: json['title'],
          backdropPath: json['backdrop_path']?? '',
          genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
          overview: json['overview'],
          voteAverage: json['vote_average'].toDouble());

  
}
