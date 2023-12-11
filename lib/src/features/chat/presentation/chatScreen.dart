import 'package:flutter/material.dart';
import 'closeWidget.dart';
import 'openWidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          automaticallyImplyLeading: false,
          title: Text(
            'Chat',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).hintColor,
                  fontSize: 20,
                ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(
                child: Text(
                  'Open',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OpenWidget(),
            CloseWidget(),
          ],
        ),
      ),
    );
  }
}
