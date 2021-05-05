class Movies {
  List<Movie> movies;

  Movies({this.movies});

  factory Movies.fromJson(Map<String, dynamic> json){
    var arrayMovie = json['results'] as List;
    List<Movie> movieList = arrayMovie.map( (item) => Movie.fromJson(item)).toList();

    return Movies(
      movies: movieList
    );
  }
}

class Movie {
  String img;
  String title;
  String releaseDate;
  num voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    releaseDate = json['release_date'];
    title = json['title'];
    img = "https://image.tmdb.org/t/p/w300"+json['poster_path'];
    voteAverage = json['vote_average']; 
  } 
}