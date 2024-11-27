import 'package:flutter/material.dart';
import 'jokes.dart'; 

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: JokeList(),
      ),
    ));

class JokeList extends StatefulWidget {
  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  int? _favoriteIndex;

  void onFavoriteClick(int index) {
    setState(() {
      if (_favoriteIndex == index) {
        _favoriteIndex = null;
      } else {
        _favoriteIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          jokes: jokes[index],
          isFavorite: _favoriteIndex == index,
          onFavoriteClick: () => onFavoriteClick(index),
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Jokes jokes;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.jokes,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jokes.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(jokes.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
