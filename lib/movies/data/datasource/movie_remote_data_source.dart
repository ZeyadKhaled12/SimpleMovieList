
import 'package:dio/dio.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../models/movie_model.dart';



abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPLayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovies();

}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{



  @override
  Future<List<MovieModel>> getNowPLayingMovie() async{
    final response = await Dio().get(
        ApiConstance.nowPLayingMoviesPath
    );

    if(response.statusCode == 200){
      return List<MovieModel>.from((response
          .data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async{
    final response = await Dio().get(
        ApiConstance.popularMoviesPath
    );

    if(response.statusCode == 200){
      return List<MovieModel>.from((response
          .data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(
        ApiConstance.topRatedMoviesPath
    );

    if(response.statusCode == 200){
      return List<MovieModel>.from((response
          .data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(ErrorMessageModel.fromJson(response.data));
    }
  }
}