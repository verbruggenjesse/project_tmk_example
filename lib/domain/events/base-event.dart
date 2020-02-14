import 'package:project_tmk_example/domain/interfaces/i-event.dart';

class BaseEvent implements IEvent {
  String id;
  @override
  String topic;
  @override
  String action;
  @override
  Map<String, String> metadata;
  @override
  String payload;
}
