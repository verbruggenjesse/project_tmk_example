import 'package:project_tmk_example/application/events/chat/send-chat.event.dart';
import 'package:project_tmk_example/domain/interfaces/i-command.dart';
import 'package:project_tmk_example/domain/interfaces/i-event.dart';

class SendMessageCommand implements ICommand {
  // private constructor
  SendMessageCommand._(this._user, this._message);

  factory SendMessageCommand.build(String user, String message) {
    return SendMessageCommand._(user, message);
  }

  String _message;
  String _user;

  IEvent execute() {
    if (this._message.isEmpty) return null;

    return SendChatEvent.build(
      SendChatEventPayload(user: this._user, message: this._message),
    );
  }
}
