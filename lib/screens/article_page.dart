import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String author;
  final String content;
  final String date;
  const ArticlePage(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.content,
      required this.date,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issues'),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      author,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(description,
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              Text(content,
                  style: const TextStyle(
                    fontSize: 15,
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
