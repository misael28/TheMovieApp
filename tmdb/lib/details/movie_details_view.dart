import "package:flutter/material.dart";
import "../details/movie_details_controller.dart";
import "../home/movie.dart";
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
                    ButtonTheme(
                      minWidth:20,
                      height: 20,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, "Home");
                        }, 
                        child: Text("Back")),
                    )
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
