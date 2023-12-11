import 'package:flutter/material.dart';
import '../../../../../constans.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20 / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(
              Icons.add_circle,
              color: Color(0xfffA5B0EC),
              size: 25,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20 * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF00BF6D).withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10 / 6),
                    Expanded(
                      child: TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                          border: InputBorder.none,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                            ),
                      ),
                    ),
                    const SizedBox(width: 20 / 4),
                    const Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                    ),
                  ],
                ),
              ),
            ),
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 37, 94, 140),
              child: Center(
                child: Icon(
                  Icons.send,
                  color: backiconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
