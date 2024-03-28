import 'package:flutter/material.dart';
import 'package:untitled/Pages/Comic.dart';
import 'package:untitled/main.dart';
import 'package:untitled/Pages/FavWishComics.dart'; // Импортируем только если нужно

class ComicPage extends StatefulWidget {
  final Comic comic;

  ComicPage(this.comic);

  @override
  _ComicPageState createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  List<Comic> wishlistComics = []; // Создаем список желаемых комиксов
  List<Comic> favoriteComics = []; // Создаем список избранных комиксов

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.comic.title, style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.comic.description),
                  SizedBox(height: 20),
                  Text(widget.comic.price),
                ],
              ),
            ),
            Container(
              height: 620,
              child: PageView.builder(
                itemCount: widget.comic.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.network(
                      widget.comic.images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      setState(() {
                        favoriteComics.add(widget.comic); // Добавляем текущий комикс в избранное
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        wishlistComics.add(widget.comic); // Добавляем текущий комикс в список желаемого
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}