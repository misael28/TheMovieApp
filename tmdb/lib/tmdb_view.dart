import "package:flutter/material.dart";

Color backGroundColor = Color(0xff34343c);
class TmdbView extends StatefulWidget {
  @override
  _TmdbViewState createState() => _TmdbViewState();
}

class _TmdbViewState extends State<TmdbView> {
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
              Expanded(
                child: 
                ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MovieCard();
                  })
                ), 
          )
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      width: 400,
      height: 200,
      color: Colors.red,
    );
  }
}