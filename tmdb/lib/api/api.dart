import 'package:http/http.dart' as http;
import 'dart:convert';
import '../home/movie.dart';

class API {
  Future<Movies> fetchMovies() async {
     final response =
     await http.get(
       Uri.https(
         "api.themoviedb.org", 
         "/3/movie/upcoming",
     {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',}
    ));

    if(response.statusCode == 200){
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Failed to load movies");
    }
  }

  Future<Movies> fetchTopMovies() async {
     final response =
     await http.get(
       Uri.https(
         "api.themoviedb.org", 
         "/3/movie/top_rated",
     {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',}
    ));

    if(response.statusCode == 200){
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Failed to load movies");
    }
  }

    Future<Movies> fetchPopularMovies() async {
     final response =
     await http.get(
       Uri.https(
         "api.themoviedb.org", 
         "/3/movie/popular",
     {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',}
    ));

    if(response.statusCode == 200){
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Failed to load movies");
    }
  }

  Future<MovieDetails> getMovieDetails(int id) async {
    final response = await http.get(
       Uri.https(
         "api.themoviedb.org", 
         "/3/movie/$id",
     {'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',}
    ));

    if(response.statusCode == 200){
      return MovieDetails.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Failed to load movie");
    }
  }
}