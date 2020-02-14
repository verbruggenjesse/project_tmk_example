import 'package:project_tmk_example/domain/interfaces/i-event.dart';

abstract class ICommand {
  IEvent execute();
}
