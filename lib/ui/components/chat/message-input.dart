import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_tmk_example/application/commands/chat/send-message.command.dart';
import 'package:project_tmk_example/domain/interfaces/i-command.dart';
import 'package:project_tmk_example/domain/interfaces/i-event-publisher.dart';
import 'package:project_tmk_example/application/shared-state/login/user.state.dart';
import 'package:provider/provider.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({Key key}) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  IEventPublisher _publisher;
  TextEditingController _messageController;
  String activeUser;

  @override
  void initState() {
    super.initState();

    _publisher = GetIt.I<IEventPublisher>();
    _messageController = TextEditingController();
  }

  void sendMessage() async {
    activeUser = Provider.of<User>(context).username;

    ICommand sendMessageCommand =
        SendMessageCommand.build(activeUser, _messageController.text);

    _publisher.publish(sendMessageCommand.execute());

    setState(() {
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 236, 236, 236),
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 80,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    isDense: true,
                  ),
                  controller: _messageController,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: sendMessage,
            )
          ],
        ));
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
