import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repo.dart';

class GetNowPopularMoviesUC extends BaseUseCase<List<Movie>>{

  final BaseMoviesRepo baseMoviesRepo;

  GetNowPopularMoviesUC(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMoviesRepo.getPopularMovies();
  }

}