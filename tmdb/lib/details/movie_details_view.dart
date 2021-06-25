import "package:flutter/material.dart";
import "../details/movie_details_controller.dart";
import "../home/movie.dart";

Color backGroundColor = Color(0xff34343c);
class MovieDetailsScreen extends StatefulWidget {
  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}
class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final controller = MovieDetailsController();
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context).settings.arguments;
    if(id != null ){
      controller.loadMovieDetails(id);
    } else {
       controller.loadMovieDetails(238);
    }
    return Scaffold(
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
        child: FutureBuilder<MovieDetails>(
          future: controller.details,
          builder: (context, snapshot) {
            if(snapshot.connectionState!= ConnectionState.done){
              return
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: CircularProgressIndicator()),
                );
            }

            if(snapshot.hasData){
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: 
                Column(
                  children: [
                    Container(
                      child: Text(
                        snapshot.data.title,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                        ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            snapshot.data.img
                          )
                        )
                      ),
                    ),
                     Container(
                      child: Text(
                        snapshot.data.releaseDate,
                        style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        )
                        ),
                    ),
                     Container(
                      child: Text(
                        '${snapshot.data.voteAverage}',
                        style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.normal,
                        color: Colors.yellow,
                        )
                        ),
                    ),
                    Container(
                      child: Text(
                        snapshot.data.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                         fontWeight: FontWeight.normal,
                        color: Colors.white,
                        )
                        ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black54)),
                      onPressed: (){
                        Navigator.pushNamed(context, "Home");
                      }, 
                    child: Text("Back")),
                  ],
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
          }),
      ),
    );
  }
}
