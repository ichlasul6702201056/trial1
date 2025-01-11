import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trial1/components/custom_drawer.dart';
// import 'package:trial1/extra/no_over_scroll_behaviour.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List settingList = ["Account", "Bookmark", "Privacy and Security"];
  String? _email;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Setting'),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Card(
                margin: EdgeInsets.all(14),
                child: ListTile(
                  leading: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.person),
                  ),
                  title: Text(_email ?? 'No email'),
                  subtitle: const Text("-"),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ...settingList.map(
              (item) => Card(
                child: ListTile(
                  title: Text(item),
                ),
              ),
            ),
            const Divider(),
            Card(
              child: ListTile(
                title: const Center(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () => {
                  context.push('/login'),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
