import 'package:flutter/material.dart';
import 'package:project_tmk_example/ui/components/chat/list/item.dart';
import 'package:project_tmk_example/application/shared-state/chat/chat-list-readmodel.state.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<ChatListReadmodel>(context).messages;

    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, i) => Provider.value(
        value: messages.elementAt(i),
        child: ChatItem(),
      ),
      reverse: true,
    );
  }
}
