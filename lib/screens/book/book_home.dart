import 'package:flutter/material.dart';
import 'package:trial1/components/custom_bottom_navigation_bar.dart';
import 'package:trial1/components/custom_drawer.dart';
import 'package:trial1/components/custom_list_preview.dart';
// import 'package:trial1/components/custom_tile_home.dart';
import 'package:trial1/extra/dummy_book_data.dart';
import 'package:trial1/extra/no_over_scroll_behaviour.dart';

class BookHome extends StatelessWidget {
  const BookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: ScrollConfiguration(
        behavior: NoOverscrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/images/banner.png'),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomListPreview(
                books: dumtrial1s,
                title: 'Popular',
              ),
              CustomListPreview(
                books: dumtrial1s,
                title: 'Recommended',
              ),
              CustomListPreview(
                books: dumtrial1s,
                title: 'Discover',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentPage: 0,
      ),
    );
  }
}
