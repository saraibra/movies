
import 'package:films/screens/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'DetailsScreen.dart';

class PopularMovies extends StatelessWidget {
  final  List popular;
  const PopularMovies({Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Trending Movies',
            size: 26, color: Colors.white,
          ),
          //  SizedBox(height: 10),
          Container(
              height: 270,
              width:double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  name: popular[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      popular[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      popular[index]['poster_path'],
                                  description: popular[index]['overview'],
                                  vote: popular[index]['vote_average']
                                      .toString(),
                                  launch_on: popular[index]
                                  ['release_date'],
                                )));
                      },
                      child: Container(
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
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        popular[index]['poster_path']),
                                fit: BoxFit.cover,
                              )
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                size: 15,
                                text: popular[index]['title'] != null
                                    ? popular[index]['title']
                                    : 'Loading', color: Colors.white,),
                            )
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
