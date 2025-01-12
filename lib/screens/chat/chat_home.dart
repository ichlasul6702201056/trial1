import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isAuthenticated = false;
  bool _isSending = false;

  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  void _checkAuthState() {
    _auth.authStateChanges().listen((User? user) {
      setState(() {
        _isAuthenticated = user != null;
      });
      if (user == null) {
        print('User is currently signed out!');
        _signInAnonymously();
      } else {
        print('User is signed in! UID: ${user.uid}');
      }
    });
  }

  Future<void> _signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
      print('Signed in anonymously');
    } catch (e) {
      print('Error signing in anonymously: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in. Please try again.')),
      );
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message cannot be empty')),
      );
      return;
    }

    setState(() {
      _isSending = true;
    });

    var user = _auth.currentUser;
    if (user == null) {
      print('User is not authenticated');
      await _signInAnonymously();
      user = _auth.currentUser;
    }

    if (user != null) {
      try {
        await _firestore.collection('chat').add({
          'content': _controller.text,
          // 'sender': user.uid,
          'sender': "anonymous",
          'time': FieldValue.serverTimestamp(),
        });
        _controller.clear();
        print('Message sent by UID: ${user.uid}');
      } catch (e) {
        print('Error sending message: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message. Please try again.')),
        );
      }
    } else {
      print('User is still not authenticated');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to authenticate. Please try again.')),
      );
    }

    setState(() {
      _isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore.collection('chat').orderBy('time').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error loading messages'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No messages yet'));
                }

                var messages = snapshot.data!.docs;
                List<Widget> messageWidgets = [];
                for (var message in messages) {
                  var messageText = message['content'];
                  var messageSender = message['sender'];
                  var messageTime = message['time'] != null
                      ? (message['time'] as Timestamp).toDate()
                      : DateTime.now();

                  var messageWidget = ListTile(
                    title: Text(messageSender),
                    subtitle: Text(messageText),
                    trailing: Text(
                      '${messageTime.hour}:${messageTime.minute}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                  messageWidgets.add(messageWidget);
                }
                return ListView(
                  children: messageWidgets,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: _isSending
                      ? CircularProgressIndicator()
                      : Icon(Icons.send),
                  onPressed: _isSending ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
