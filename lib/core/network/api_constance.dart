class ApiConstance{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'e717277e7539562f373b365a9a9de7a2';
  static const String nowPLayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  static String movieDetailPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl/$path';

}