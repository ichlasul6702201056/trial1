import 'package:flutter/material.dart';
import 'package:trial1/components/custom_card_book_home.dart';
import 'package:trial1/themes/typo.dart';

class GridViewMore extends StatelessWidget {
  final String? title;
  const GridViewMore({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        title: Text(
          title ?? 'title',
          style: Typo.ViewMoreTitle,
        ),
      ),
      body: GridView.count(
        childAspectRatio: 0.6,
        crossAxisCount: 3, // Determines the number of columns
        children: List.generate(21, (index) {
          return Padding(
            padding: const EdgeInsets.all(2), // Add padding around each item
            child: CustomCardBookHome(
              height: 180,
              title: '$index',
              bookCover: const Image(
                image: AssetImage('assets/images/book.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          );
        }),
      ),
    );
  }
}
