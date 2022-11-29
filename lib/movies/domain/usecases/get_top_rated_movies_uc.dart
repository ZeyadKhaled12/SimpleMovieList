import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repo.dart';

class GetTopRatedMoviesUC extends BaseUseCase<List<Movie>>{

  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedMoviesUC(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMoviesRepo.getTopRatedMovies();
  }

}