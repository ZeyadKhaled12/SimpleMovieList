
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_uc.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_uc.dart';
import 'package:movies_app/movies/presentation/controller/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';

import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repo.dart';
import '../../movies/domain/repository/base_movies_repo.dart';
import '../../movies/domain/usecases/get_now_playing_movies_uc.dart';
import '../../movies/domain/usecases/get_popular_movies_uc.dart';


final sl = GetIt.instance;

class ServicesLocator{
  void init(){

    //Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(sl()));

    //Use Case
    sl.registerLazySingleton(() =>
        GetNowPlayingMoviesUC(sl()));
    sl.registerLazySingleton(() =>
        GetNowPopularMoviesUC(sl()));
    sl.registerLazySingleton(() =>
        GetTopRatedMoviesUC(sl()));
    sl.registerLazySingleton(() =>
        GetMovieDetailUc(sl()));

    //Repo
    sl.registerLazySingleton<BaseMoviesRepo>(() =>
        MovieRepo(sl()));

    //Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() =>
        MovieRemoteDataSource());

  }

}