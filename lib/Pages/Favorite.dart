import 'package:flutter/material.dart';
import 'package:untitled/Pages/Comic.dart';
import 'package:untitled/Pages/ComicPage.dart';
import 'package:untitled/main.dart';

class FavoritePage extends StatelessWidget {
  final List<Comic> favoriteComics;

  FavoritePage(this.favoriteComics);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Понравившиеся комиксы', style: TextStyle(color: Colors.black)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
          )
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: favoriteComics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteComics[index].title),
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: ClipOval(
                child: Image.network(
                  favoriteComics[index].images[0],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ComicPage(favoriteComics[index])));
            },
          );
        },
      ),
    );
  }
}