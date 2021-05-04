import 'movie.dart';
import 'api.dart';

class MovieModel {  
  Future<List<Movie>> _movies;

  Future<List<Movie>> get movies => _movies;
  fetcthMovie(){
   _movies = API().fetchMovies() as Future<List<Movie>>;
  }

}