part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieRequestState;
  final String messageMovieDetail;

  const MovieDetailState({
    this.movieDetail,
    this.movieRequestState = RequestState.loading,
    this.messageMovieDetail = ''
  });

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieRequestState,
    String? messageMovieDetail}){
    return MovieDetailState(
      movieDetail: movieDetail?? this.movieDetail,
        messageMovieDetail: messageMovieDetail?? this.messageMovieDetail,
      movieRequestState: movieRequestState?? this.movieRequestState
    );
  }

  @override
  List<Object?> get props => [movieDetail, movieRequestState, messageMovieDetail];
}


