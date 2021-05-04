class Movies {
  String img;
  String title;
  String releaseDate;
  List<Movie> movies;

  Movies.fromJson(Map<String, dynamic> json){
    var arrayMovies = json['results'];
    movies = arrayMovies.map( (item) {
      return Movies.fromJson(item['results']);
    }).toList();
  }
}

class Movie {
  String img;
  String title;
  String releaseDate;

  Movie.fromJson(Map<String, dynamic> json) {
    releaseDate = json['release_date'];
    title = json['title'];
    img = json['poster_path'];
  } 
}