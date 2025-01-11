import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentPage;
  final int currentIndex;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentPage,
    this.currentIndex = 0,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _currentPage;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _currentPage = widget.currentPage;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    String basePath = _currentPage == 0 ? '/book' : '/vid';
    print(basePath);
    switch (index) {
      case 0:
        context.replace('$basePath/home');
        break;
      case 1:
        context.replace('$basePath/search');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.house),
          label: 'Home',
          key: Key('home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          key: Key('search'),
        ),
      ],
      backgroundColor: Colors.grey[100],
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
    );
  }
}
