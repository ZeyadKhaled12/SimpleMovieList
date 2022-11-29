import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_uc.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_uc.dart';

import '../../domain/usecases/get_now_playing_movies_uc.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUC getNowPlayingMoviesUC;
  final GetNowPopularMoviesUC getNowPopularMoviesUC;
  final GetTopRatedMoviesUC getTopRatedMoviesUC;

  MoviesBloc(this.getNowPlayingMoviesUC, this.getNowPopularMoviesUC,
      this.getTopRatedMoviesUC)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUC.call();
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getNowPopularMoviesUC.call();
    result.fold(
            (l) => emit(state.copyWith(
            popularMoviesState: RequestState.error,
            popularMessage: l.message)),
            (r) => emit(state.copyWith(
            popularMovies: r, popularMoviesState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUC.call();
    result.fold(
            (l) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message)),
            (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)));

  }
}
