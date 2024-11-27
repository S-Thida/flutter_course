import 'package:flutter/material.dart';

class FavoriteCards extends StatefulWidget {
  bool isFavorite= true;
   FavoriteCards({super.key, required this.isFavorite});

  @override
  State<FavoriteCards> createState() => _FavoriteCardsState();
}

class _FavoriteCardsState extends State<FavoriteCards> {
  @override
  Widget build(BuildContext context) {
    return  Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text('description')
                      ],
                    ),
                  ),
                 IconButton(
            icon: widget.isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                widget.isFavorite = !widget.isFavorite;
              });
            },
          ),
        ],
      ),
    );
  }
}
void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
          FavoriteCards(isFavorite: true),
          FavoriteCards(isFavorite: false),
          FavoriteCards(isFavorite: true),
          ],
        ),
      ),
    ));
