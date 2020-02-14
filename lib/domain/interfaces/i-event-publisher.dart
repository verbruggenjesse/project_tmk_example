import 'package:project_tmk_example/domain/interfaces/i-event.dart';
import 'package:project_tmk_example/domain/interfaces/i-result.dart';

abstract class IEventPublisher {
  Future<IResult> publish(IEvent event);
}
