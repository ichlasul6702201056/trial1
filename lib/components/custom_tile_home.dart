import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trial1/components/custom_card_book_home.dart';
import 'package:trial1/components/section_bar_home.dart';

class CustomTileHome extends StatelessWidget {
  final String? title;

  const CustomTileHome({
    super.key,
    this.title,
  });

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
            IconButton(
              onPressed: () => context.go('/see-more', extra: title),
              icon: const Icon(Icons.arrow_right),
            )
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CustomCardBookHome(
                title: title,
                bookCover: const Image(
                  image: AssetImage('assets/images/book.jpg'),
                ),
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
