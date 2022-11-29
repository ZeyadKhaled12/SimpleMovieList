

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repository/base_movies_repo.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepo extends BaseMoviesRepo{

  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepo(this.baseMovieRemoteDataSource);


  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async{
    final result = await baseMovieRemoteDataSource.getNowPLayingMovie();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}