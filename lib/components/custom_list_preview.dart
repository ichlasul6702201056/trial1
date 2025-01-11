import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trial1/components/section_bar_home.dart';
import 'package:trial1/extra/dummy_book_data.dart';
import 'package:trial1/components/custom_card_book_home.dart';

class CustomListPreview extends StatelessWidget {
  final List<Book> books;
  final String title;

  const CustomListPreview(
      {super.key, required this.books, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionBarHome(
              title: title,
            ),
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomCardBookHome(
                title: books[index].title,
                author: books[index].author,
                bookCover: const Image(
                  image: AssetImage('assets/images/book.jpg'),
                ),
                // bookCover: Image.network(books[index].coverImage),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class BookHome extends StatelessWidget {
  const BookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Home'),
      ),
      body: CustomListPreview(
        books: dumtrial1s,
        title: 'Popular Books',
      ),
    );
  }
}
