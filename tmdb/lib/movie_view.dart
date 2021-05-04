import "package:flutter/material.dart";
import 'movie.dart';
import "movie_controller.dart";

Color backGroundColor = Color(0xff34343c);
class MovieView extends StatefulWidget {
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  final controller = MovieController();
  final controllerList = ScrollController();
  int indexSize = 0;
  @override
  void initState() {
    super.initState();
    controller.loadMovies();
    controllerList.addListener(() {
      setState((){indexSize++;}
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Best Movies"),
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
              MovieContainer(sizeScreen),
              MovieContainer(sizeScreen),
              MovieContainer(sizeScreen)
              ],
          ),
        ),
      ),
    );
  }

  Widget MovieContainer(Size sizeScreen){
    return Container(
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
                           controller: controllerList,
                           itemCount: snapshot.data.movies.length,
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  snapshot.data.movies[index].img
                                ),
                              ),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: indexSize == index ? sizeScreen.width * 0.6 : sizeScreen.width * 0.5,
                            height: indexSize == index ? sizeScreen.height * 0.5 : sizeScreen.height * 0.4,
                            // child:
                            // Image.network(snapshot.data.movies[index].img,
                            //   width: sizeScreen.width * 0.4,
                            //   height: sizeScreen.height * 0.4,
                            //   fit: BoxFit.cover),
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
            );
  }
}

