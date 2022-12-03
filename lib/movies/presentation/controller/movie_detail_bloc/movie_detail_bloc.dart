import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_uc.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailUc) : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
  }

  final GetMovieDetailUc getMovieDetailUc;

  FutureOr<void> _getMovieDetail(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailUc(MovieDetailParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieRequestState: RequestState.error,
            messageMovieDetail: l.message)),
        (r) => emit(state.copyWith(
            movieDetail: r, movieRequestState: RequestState.loaded)));
  }
}
