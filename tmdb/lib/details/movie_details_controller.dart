import '../model/movie_model.dart';
import '../home/movie.dart';
class MovieDetailsController {
  final model = MovieDetail();

  Future<MovieDetails> get details => model.details;

  loadMovieDetails(int id){
    model.fetchMovieDetails(id);  
  }

}