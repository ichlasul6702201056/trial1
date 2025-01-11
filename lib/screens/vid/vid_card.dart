import 'package:flutter/material.dart';

class CustomVidCard extends StatelessWidget {
  final String title;
  final String description;

  const CustomVidCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class CustomVidCardList extends StatelessWidget {
  final List<Map<String, String>> videos;

  const CustomVidCardList({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return CustomVidCard(
          title: videos[index]['title']!,
          description: videos[index]['description']!,
        );
      },
    );
  }
}
