import 'package:error/src/features/chat/presentation/chatBox/chatInput.dart';
// import 'package:error/src/features/chat/presentation/chatBox/chatMessage.dart';
import 'package:error/src/features/chat/presentation/chatBox/message.dart';
// import 'package:error/src/features/chat/presentation/chatBox/message.dart';
import 'package:flutter/material.dart';

import 'chatBox/ChatMessage.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FLIPKART INDIA PRIVATE LIMITED',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Message(
                  message: demeChatMessages[index],
                ),
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}
