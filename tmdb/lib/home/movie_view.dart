import "package:flutter/material.dart";
import 'movie.dart';
import "movie_controller.dart";

Color backGroundColor = Color(0xff34343c);
class MovieView extends StatefulWidget {
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  final controller = MovieController();
  final controllerTopMovie = MovieController();
  final controllerPopularMovie = MovieController();

  int indexSize = 0;
  @override
  void initState() {
    super.initState();
    controller.loadMovies();
    controllerTopMovie.loadTopMovies();
    controllerPopularMovie.loadPopularMovies();
  }
  
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies", 
          style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: backGroundColor,
      ),
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.black,
                  backGroundColor,
                  ]
                )
              ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MovieContainer(sizeScreen,"Upcoming", controller),
              MovieContainer(sizeScreen,"Top rated", controllerTopMovie),
              MovieContainer(sizeScreen,"Popular", controllerPopularMovie)
              ],
          ),
        ),
      ),
    );
  }

  Widget MovieContainer(Size sizeScreen, String sessionText, MovieController controller){
    return Column(
      children: [
        Text(
          sessionText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ), 
        ),
        Container(
                  child:
                   FutureBuilder<Movies>(
                    future: controller.movies,
                    builder: (context, snapshot) {
                      if(snapshot.connectionState!= ConnectionState.done){
                        return
                            Container(
                              height: sizeScreen.height,
                              width: sizeScreen.width,
                              child: Center(child: CircularProgressIndicator()),
                            );
                      }
                      if(snapshot.hasData){
                        return Container(
                          width: double.infinity,
                          height: sizeScreen.height * 0.5,
                          child: 
                          ListView.builder(
                               itemCount: snapshot.data.movies.length,
                               scrollDirection: Axis.horizontal,
                               itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: sizeScreen.width * 0.5,
                                    height: sizeScreen.height * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data.movies[index].img
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                          }
                          )
                        );
                      } else if (snapshot.hasError) { 
                        return Text(snapshot.error,
                        style: 
                        TextStyle(
                          color: Colors.red, 
                          fontSize: 20));
                      }
                      return Container();
                    },
                  ),     
                ),
      ],
    );
  }
}

