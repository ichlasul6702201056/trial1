import 'package:flutter/material.dart';

class CustomCardBookHome extends StatelessWidget {
  final Image bookCover;
  final String? title;
  final String? author;
  final double? height;

  const CustomCardBookHome({
    super.key,
    required this.bookCover,
    this.title,
    this.author,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: 100,
              height: (height ?? 120),
              child: bookCover),
          const SizedBox(height: 8),
          Text(title ?? 'title'),
          Text(
            author ?? 'author',
            style: const TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
