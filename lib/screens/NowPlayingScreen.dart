
import 'package:films/screens/utils/components.dart';
import 'package:films/screens/utils/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'DetailsScreen.dart';

class NowPlaying extends StatelessWidget {

  final List nowplaying;

  const  NowPlaying({Key? key, required this.nowplaying}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 200,
              child: buildPageList(context:context,movies: nowplaying)
            /*ListView.builder(
                  itemCount: nowplaying.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  name: nowplaying[index]['title'],
                                  bannerurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['backdrop_path'],
                                  posterurl:
                                  'https://image.tmdb.org/t/p/w500' +
                                      nowplaying[index]['poster_path'],
                                  description: nowplaying[index]['overview'],
                                  vote:nowplaying[index]['vote_average']
                                      .toString(),
                                  launch_on:nowplaying[index]
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
                                      nowplaying[index]['poster_path']),
                                fit: BoxFit.cover,
                            ),),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                size: 15,
                                text: nowplaying[index]['original_name'] != null
                                    ? nowplaying[index]['original_name']
                                    : 'Loading', color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    );
                  })*/)
        ],
      ),
    );
  }
}
