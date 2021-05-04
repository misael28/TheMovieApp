import 'movie_model.dart';
import 'movie.dart';

class MovieController {
  final model = MovieModel();

  Future<List<Movie>> get movies => model.movies;

  loadMovies(){
    model.fetcthMovie();  
  }
}