import "package:flutter/material.dart";
import 'movie.dart';
import "movie_controller.dart";

Color backGroundColor = Color(0xff34343c);
class MovieView extends StatefulWidget {
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {

  final controller = MovieController();
  @override
  void initState() {
    super.initState();
    controller.loadMovies();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Best Movies"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 500,
            width: 500,
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
            child:
             FutureBuilder<List<Movie>>(
              future: controller.movies,
              builder: (context, snapshot) {
                if(snapshot.connectionState!= ConnectionState.done){
                  return Container(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                      ),
                  );
                }
                if(snapshot.hasData){
                  return Container(
                    child: 
                    ListView.builder(
                         itemCount: 10,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(50),
                          width: 400,
                          height: 200,
                          child:
                          Image.network(snapshot.data[index].img,
                            height: 400,
                            width:  200,
                            fit: BoxFit.cover),
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
      ),
    );
  }
}
