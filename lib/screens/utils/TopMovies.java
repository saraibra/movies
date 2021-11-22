package screens.utils;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_task/utils/text.dart';

import 'DetailsScreen.dart';

class TopMovies extends StatelessWidget {

  final List top;

  const TopMovies({ required this.top}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
     width:double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          modified_text(text: 'Top Rated Movies',color: Colors.white, size: 26,),
          SizedBox(height: 10,),
          Container(height: 270,
              child:
              ListView.builder(
                  itemCount: top.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(
                                      name: top[index]['title'],
                                      bannerurl:
                                      'https://image.tmdb.org/t/p/w500' +
                                          top[index]['backdrop_path'],
                                      posterurl:
                                      'https://image.tmdb.org/t/p/w500' +
                                          top[index]['poster_path'],
                                      description: top[index]['overview'],
                                      vote: top[index]['vote_average']
                                          .toString(),
                                      launch_on: top[index]
                                      ['release_date'],
                                    )),
                    );
                      },
                      child: Container(
                        width:double.infinity,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              width:double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          top[index]['poster_path']),
                             fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                size: 15,
                                text: top[index]['title'] != null
                                    ? top[index]['title']
                                    : 'Loading', color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    );
       }))
        ],
      ),
    );
  }
}
