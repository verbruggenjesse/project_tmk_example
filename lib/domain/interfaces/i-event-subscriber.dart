import 'package:project_tmk_example/domain/interfaces/i-event-handler.dart';

abstract class IEventSubscriber {
  void listenForEvents();
  void addSubscriber(String topic, String action, IEventHandler handler);
}
