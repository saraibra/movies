class Movie{
  String? name;
  String? bannerurl;
  String? posterurl;
  String? description;
  String? vote;
  String? launch_on;
  Movie({this.name,this.posterurl,this.bannerurl,this.launch_on,this.vote,this.description});
  Movie.fromJson(Map json){
    name = json['title'];
    description = json['overview'];
    vote = json['vote_average'];
    bannerurl = json['overview'];
    posterurl = json['overview'];
    launch_on = json['release_date'];
  }

}