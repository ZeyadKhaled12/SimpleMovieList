import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

import '../repository/base_movies_repo.dart';

class GetMovieDetailUc extends BaseUseCase<MovieDetail, MovieDetailParameters> {

  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailUc(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameters parameters) async {
    return await baseMoviesRepo.getMovieDetail(parameters);
  }


}

class MovieDetailParameters extends Equatable {
  final int movieId;

  const MovieDetailParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];

}