

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repo.dart';

class GetNowPlayingMoviesUC extends BaseUseCase<List<Movie>, NoParameters>{

  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMoviesUC(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await baseMoviesRepo.getNowPlayingMovies();
  }

}