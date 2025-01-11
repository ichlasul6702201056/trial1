import 'package:flutter/material.dart';
import 'package:trial1/screens/vid/vid_card.dart';
import 'package:trial1/themes/typo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VidHome extends StatefulWidget {
  const VidHome({super.key});

  @override
  State<VidHome> createState() => _VidHomeState();
}

class _VidHomeState extends State<VidHome> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  String _videoTitle = 'Video Title';
  String _channelName = 'Channel Name';

  final List<String> _videoIds = [
    'TLu1bScP4Fk',
    'LqgCuXz3pu8',
    '81wIa9kwdI8',
  ];
  final List<Map<String, String>> videoData = [
    {'title': 'I WILL CATCH THE NEW BIGFOOT', 'description': 'Markiplier'},
    {'title': 'The Mortuary Assistant: Part 1', 'description': 'Markiplier'},
    {
      'title': 'THE TERROR OF THE TREES | The Forest',
      'description': 'Markiplier'
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _videoIds.first,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted) {
      setState(() {
        _videoTitle = _controller.metadata.title;
        _channelName = _controller.metadata.author;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YouTube')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              setState(() {
                _isPlayerReady = true;
                _videoTitle = _controller.metadata.title;
                _channelName = _controller.metadata.author;
              });
            },
            onEnded: (data) {
              _controller.load(
                _videoIds[
                    (_videoIds.indexOf(data.videoId) + 1) % _videoIds.length],
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Next video started!'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _videoTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _channelName,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          ...List.generate(videoData.length, (index) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    videoData[index]['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(videoData[index]['description']!),
                ),
                const Divider(), // Add a divider to distinguish the space between items
              ],
            );
          }),
        ],
      ),
    );
  }
}
