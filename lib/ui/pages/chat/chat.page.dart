import 'package:flutter/material.dart';
import 'package:project_tmk_example/ui/components/chat/message-input.dart';
import 'package:project_tmk_example/ui/components/chat/message-list.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 48, left: 16),
            child: MessageList(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MessageInput(),
          ),
        ],
      ),
    );
  }
}
