
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable{
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = ''
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage
  }){
    return MoviesState(
      nowPlayingState: nowPlayingState?? this.nowPlayingState,
      nowPlayingMovies: nowPlayingMovies?? this.nowPlayingMovies,
      nowPlayingMessage: nowPlayingMessage?? this.nowPlayingMessage,
      popularMessage: popularMessage?? this.popularMessage,
      popularMovies: popularMovies?? this.popularMovies,
      popularMoviesState: popularMoviesState?? this.popularMoviesState,
      topRatedMessage: topRatedMessage?? this.topRatedMessage,
      topRatedMovies: topRatedMovies?? this.topRatedMovies,
      topRatedState: topRatedState?? this.topRatedState
    );
  }

  @override
  List<Object?> get props => [nowPlayingMovies, nowPlayingState, nowPlayingMessage,
  popularMovies, popularMoviesState, popularMessage,  topRatedMovies, topRatedState,topRatedMessage];

}