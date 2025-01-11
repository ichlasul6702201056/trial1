import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:trial1/components/custom_bottom_navigation_bar.dart';
import 'package:trial1/components/custom_drawer.dart';

class BookSearch extends StatefulWidget {
  final String? query;
  const BookSearch({super.key, this.query});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<BookSearch> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
        ),
      ]),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentPage: 0,
      ),
    );
  }
}
