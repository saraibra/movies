import 'package:films/cubit/movie_cubit.dart';
import 'package:films/cubit/movie_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'NowPlayingScreen.dart';
import 'PopularMoviesScreen.dart';
import 'TopMoviesScreen.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
        MovieCubit()
          ..loadmovies(),
        child: BlocConsumer<MovieCubit, MovieStates>(
          builder: (context, state) {
            MovieCubit.get(context).loadmovies();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('MOVIES'),
                    bottom: TabBar(
                      tabs: [
                        Tab(text: "Top Movies"),
                        Tab(text: "Popular"),
                        Tab(text: "Now Playing"),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [TopMovies(top:MovieCubit.get(context).topmovies),
                     PopularMovies(popular:MovieCubit.get(context).popularmovies),
                      NowPlaying(nowplaying: MovieCubit.get(context).nowplayingmovies),


                    ],

                  ),
                ),
              ),
            );
          },
          listener: (context, state) {},
        )
    );
  }
}













