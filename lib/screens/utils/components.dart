import 'package:films/cubit/movie_cubit.dart';
import 'package:films/models/Movie.dart';
import 'package:films/screens/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tmdb_api/tmdb_api.dart';

Widget buildPageList ({required BuildContext context,required List movies })=>
    PaginationView<Movie>(
      paginationViewType: MovieCubit.get(context).paginationViewType,
  key: MovieCubit.get(context).key,
  shrinkWrap: true,
  padding: EdgeInsets.only(
    left: 5,
    right: 5,
  ),
      footer: Container(
    height: 0.5,
    color: Colors.black,
  ),
  itemBuilder: (BuildContext context, Movie movie,int index) {
    return Container(
      padding: EdgeInsets.all(5),
      width:double.infinity,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(5),
              width:double.infinity,
              height:140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
              child:Image(
                image: NetworkImage(movie.posterurl!
                 ),
                fit: BoxFit.cover,
              )
          ),
          SizedBox(height: 5),
          Container(
            child: modified_text(
              size: 15,
              text: movie.name! != null
                  ? movie.name!
                  : 'Loading', color: Colors.white,),
          )
        ],
      ),
    );
  },
  pageFetch: MovieCubit.get(context).pageFetch,
  onError: (dynamic error) => Center(
    child: Text('Something Went Wrong'),
  ),


  onEmpty: Center(
    child: Text('Empty List'),
  ),

);


