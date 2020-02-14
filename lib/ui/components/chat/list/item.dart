import 'package:flutter/material.dart';
import 'package:project_tmk_example/domain/models/chat-message.dart';
import 'package:provider/provider.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = Provider.of<ChatMessage>(context);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.user + ": "),
          Flexible(
            child: Text(message.message),
          )
        ],
      ),
    );
  }
}
