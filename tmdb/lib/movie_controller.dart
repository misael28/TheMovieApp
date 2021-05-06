import 'movie_model.dart';
import 'movie.dart';

class MovieController {
  final model = MovieModel();

  Future<Movies> get movies => model.movies;

  loadMovies(){
    model.fetcthMovie();  
  }

  loadTopMovies(){
    model.fetchTopMovie();
  }

  loadPopularMovies(){
    model.fetchPopularMovie();
  }
}