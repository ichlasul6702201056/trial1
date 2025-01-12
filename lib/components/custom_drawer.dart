import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trial1/themes/color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomColorTheme.primary,
            ),
            child: const Center(
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book_sharp),
            title: Text('Book'),
            onTap: () {
              Navigator.of(context).pop();
              context.replace('/book/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.video_collection_rounded),
            title: Text('Video'),
            onTap: () {
              Navigator.of(context).pop();
              context.replace('/vid/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculator'),
            onTap: () {
              Navigator.of(context).pop();
              context.replace('/calc');
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts_rounded),
            title: Text('Contact'),
            onTap: () {
              Navigator.of(context).pop();
              context.replace('/contact');
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Chat'),
            onTap: () {
              Navigator.of(context).pop();
              context.replace('/chat');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              Navigator.of(context).pop();
              context.push('/setting');
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.of(context).pop();
              context.push('/login');
            },
          ),
        ],
      ),
    );
  }
}
