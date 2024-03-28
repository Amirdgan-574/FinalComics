import 'package:flutter/material.dart';
import 'package:untitled/Pages/Comic.dart';
import 'package:untitled/Pages/ComicPage.dart';
import 'package:untitled/main.dart';

class wishlistPage extends StatelessWidget {
  final List<Comic> wishlistComics;

  wishlistPage(this.wishlistComics);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Избранные комиксы', style: TextStyle(color: Colors.black)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              }
          )
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.builder(
        itemCount: wishlistComics.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(wishlistComics[index].title),
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: ClipOval(
                child: Image.network(
                  wishlistComics[index].images[0],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ComicPage(wishlistComics[index])));
            },
          );
        },
      ),
    );
  }
}