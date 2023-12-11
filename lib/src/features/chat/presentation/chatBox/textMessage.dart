// import 'package:error/src/utils/media-query.dart';
import 'package:flutter/material.dart';
import '../../../../utils/media-query.dart';
import 'ChatMessage.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: SizeVariables.getWidth(context) * 0.56,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20 * 0.75,
        vertical: 20 / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xfff9F74E5).withOpacity(message!.isSender ? 1 : 0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message!.text,
        style: message!.isSender
            ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                )
            : Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
