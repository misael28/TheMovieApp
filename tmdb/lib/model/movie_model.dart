import '../home/movie.dart';
import '../api/api.dart';

class MovieModel {  
  Future<Movies> _movies;

  Future<Movies> get movies => _movies;

  fetcthMovie(){
   _movies = API().fetchMovies();
  }

  fetchTopMovie(){
   _movies = API().fetchTopMovies();
  }

  fetchPopularMovie(){
   _movies = API().fetchPopularMovies();
  }
}