import "package:flutter/material.dart";
import 'movie.dart';
import "movie_controller.dart";

Color backGroundColor = Color(0xff34343c);
class MovieView extends StatefulWidget {
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  final controller = MovieController();
  int indexSize = 0;
  @override
  void initState() {
    super.initState();
    controller.loadMovies();
  }
  
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.network("https://icons8.com.br/icon/111166/pipoca"),
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
              MovieContainer(sizeScreen,"Upcoming movies"),
              MovieContainer(sizeScreen,"Top rated"),
              MovieContainer(sizeScreen,"Action")
              ],
          ),
        ),
      ),
    );
  }

  Widget MovieContainer(Size sizeScreen, String sessionText){
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
                                    margin: EdgeInsets.symmetric(horizontal: 10),
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
                                    // child:
                                    // Image.network(snapshot.data.movies[index].img,
                                    //   width: sizeScreen.width * 0.4,
                                    //   height: sizeScreen.height * 0.4,
                                    //   fit: BoxFit.cover),
                                  ),
                                   Row(
                                     children: [
                                       Text(snapshot.data.movies[index].title, 
                                          style: 
                                          TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                          ),
                                          ),
                                          Text(' ${snapshot.data.movies[index].voteAverage}', 
                                          style: 
                                          TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                          ),
                                          )
                                        ],
                                   ),
                                  Row(
                                    children: [
                                      Text("Release ",
                                      style: 
                                      TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      Text(snapshot.data.movies[index].releaseDate, 
                                      style: 
                                      TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ],
                                  )
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

