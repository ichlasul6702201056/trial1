import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressedAction;
  const AppbarHome({super.key, required this.onPressedAction});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => {context.replace('/drawer')},
      ),
      actions: [
        IconButton(
          onPressed: onPressedAction,
          icon: const Icon(
            Icons.search_rounded,
          ),
        ),
      ],
    );
  }
}
