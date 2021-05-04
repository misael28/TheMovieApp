import 'movie.dart';
import 'api.dart';

class MovieModel {  
  Future<Movies> _movies;

  Future<Movies> get movies => _movies;
  fetcthMovie(){
   _movies = API().fetchMovies();
  }

}