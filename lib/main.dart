import 'package:flutter/material.dart';
import 'package:untitled/Pages/user.dart';
import 'package:untitled/Pages/Comic.dart';
import 'package:untitled/Pages/initialPage.dart';
import 'package:untitled/Pages/LoginPage.dart';
import 'package:untitled/Pages/ComicPage.dart';
import 'package:untitled/Pages/Favorite.dart';
import 'package:untitled/Pages/wishlist.dart';
import 'package:untitled/Pages/FavWishComics.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: InitialPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Comic> _comics = [
    Comic(
      title: 'Каратель',
      description: 'Каратель — онгоинг серия комиксов, действующим персонажем которой является Фрэнк Касл / Каратель',
      price: 'Рейтинг : 93',
      images: [
        'https://ii1.unicomics.ru/comics/punisher-v8/punisher-v8-001/01.jpg',
        'https://ii1.unicomics.ru/comics/punisher-v8/punisher-v8-001/02.jpg',
        'https://ii1.unicomics.ru/comics/punisher-v8/punisher-v8-001/03.jpg',
        'https://ii1.unicomics.ru/comics/punisher-v8/punisher-v8-001/04.jpg',
        'https://ii1.unicomics.ru/comics/punisher-v8/punisher-v8-001/05.jpg',
        'https://ii1.unicomics.ru/comics/punisher-v8/punisher-v8-001/06.jpg',
        'https://ii1.unicomics.ru/comics/punisher-v8/punisher-v8-001/07.jpg'
      ],
    ),
    Comic(
      title: 'Человек-Паук',
      description: 'Человек-паук (настоящее имя — Питер Бенджамин Паркер) — супергерой, появляющийся в комиксах издательства Marvel Comics. Создан Стэном Ли и Стивом Дитко.',
      price: 'Рейтинг : 87',
      images: [
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/01.jpg',
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/02.jpg',
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/03.jpg',
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/04.jpg',
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/05.jpg',
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/06.jpg',
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/07.jpg',
        'https://ii1.unicomics.ru/comics/the-sensational-spider-man/the-sensational-spider-man-23/08.jpg'
      ],
    ),
    Comic(
      title: 'Люди-Х',
      description: 'Они - Люди-Икс, команда мутантов, собранная могучим телепатом профессором Чарльзом Ксавье для защиты человечества от любых видов опасности!',
      price: 'Рейтинг : 91',
      images: [
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/01.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/02.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/03.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/05.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/06.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/07.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/08.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/09.jpg',
        'https://ii1.unicomics.ru/comics/ultimate-x-men/001/10.jpg'
      ],
    ),

  ];


  @override
  Widget build(BuildContext context) {
    List<Comic> favoriteComics = []; // Перемещаем объявления списков сюда
    List<Comic> wishlistComics = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Каталог комиксов', style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _comics.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            ComicPage(_comics[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            _comics[index].images[0],
                            width: 100,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(_comics[index].title),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _comics.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_comics[index].title),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: ClipOval(
                      child: Image.network(
                        _comics[index].images[0],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            ComicPage(_comics[index])));
                  },
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            child: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => FavoritePage(favoriteComics)));
              },
            ),
          ),
          GestureDetector(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => wishlistPage(wishlistComics)));
              },
            ),
          ),
        ],
      ),
    );
  }
}