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
  String id;
  String img;
  Movie.fromJson(Map<String, dynamic> json) {
    img = "https://image.tmdb.org/t/p/w300"+json['poster_path'];
    id = json['id'];
  } 
}

class MovieDetails {
  String id;
  String backDropImg;
  String description;
  String title;
  String releaseDate;
  num voteAverage;

   MovieDetails.fromJson(Map<String, dynamic> json) {
    releaseDate = json['release_date'];
    title = json['title'];
    backDropImg = "https://image.tmdb.org/t/p/w300"+json['backdrop_path'];
    voteAverage = json['vote_average']; 
    id = json['id'];
    description = json['overview'];
  } 
}