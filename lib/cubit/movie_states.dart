
import 'package:films/models/Movie.dart';

abstract class MovieStates {}
class MovieInitial extends MovieStates{}
class GetMovies extends MovieStates {}
class NowPlayingMoviesLoaded extends MovieStates {}

class MoviesLoaded extends MovieStates {
  final List<Movie> movies;

  MoviesLoaded(this.movies);
}