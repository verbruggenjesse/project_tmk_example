import 'package:project_tmk_example/application/events/chat/send-chat.event.dart';
import 'package:project_tmk_example/domain/interfaces/i-event-handler.dart';
import 'package:project_tmk_example/domain/interfaces/i-event.dart';
import 'package:project_tmk_example/domain/models/chat-message.dart';
import 'package:project_tmk_example/application/shared-state/chat/chat-list-readmodel.state.dart';

class SendChatEventHandler implements IEventHandler {
  ChatListReadmodel _chatListReadmodel;

  SendChatEventHandler(ChatListReadmodel chatListReadmodel) {
    _chatListReadmodel = chatListReadmodel;
  }

  void handle(IEvent event) {
    final payload = SendChatEventPayload.fromRawJson(event.payload);
    final message = ChatMessage(user: payload.user, message: payload.message);

    _chatListReadmodel.receiveMessage(message);
  }
}
