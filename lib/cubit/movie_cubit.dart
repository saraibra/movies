import 'package:films/cubit/movie_states.dart';
import 'package:films/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;

class MovieCubit extends Cubit<MovieStates>{
  MovieCubit() : super(MovieInitial());
  static MovieCubit get(context) => BlocProvider.of(context);

  List popularmovies = [];
  List topmovies = [];
  List  nowplayingmovies = [];
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';
  loadmovies()async{
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map popularresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map toprmoviesresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map nowplayingresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
      popularmovies = popularresult['results'];
      topmovies = toprmoviesresult['results'];
      nowplayingmovies = nowplayingresult['results'];
    print(popularmovies);
      emit(GetMovies());


  }
  int page=0;
  PaginationViewType paginationViewType=PaginationViewType.listView;
  GlobalKey<PaginationViewState>? key;
  Future<List<Movie>> pageFetch(int offset) async {
    page = (offset / 20).round();



    final List<Movie> upcomingList = List.generate(
      15,
          (int index) => Movie(
        name: nowplayingmovies[index]['title'],
            bannerurl:  'https://image.tmdb.org/t/p/w500' +
                nowplayingmovies[index]['backdrop_path'],
            posterurl:  'https://image.tmdb.org/t/p/w500' +
                nowplayingmovies[index]['poster_path'],
            description: nowplayingmovies[index]['overview'],
            vote:nowplayingmovies[index]['vote_average']
                .toString(),
            launch_on:nowplayingmovies[index]
            ['release_date'],


      ),
    );
    print(nowplayingmovies[0]['title']);
 await Future<List<Movie>>.delayed(
   Duration(milliseconds: 1500),
  );
 emit(NowPlayingMoviesLoaded());
    return page == 5 ? [] : upcomingList;
  }
}