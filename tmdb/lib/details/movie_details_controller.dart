import 'package:tmdb/details/movie_details_view.dart';

import '../model/movie_model.dart';

class MovieController {
  final model = MovieDetail();

  Future<MovieDetails> get details => model.details;

  loadMovies(int id){
    model.fetchMovieDetails(id);  
  }

}