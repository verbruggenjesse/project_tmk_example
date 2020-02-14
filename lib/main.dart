import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_tmk_example/application/events/chat/send-chat.event.dart';
import 'package:project_tmk_example/application/handlers/send-chat-event-handler.dart';
import 'package:project_tmk_example/domain/interfaces/i-event-publisher.dart';
import 'package:project_tmk_example/infrastructure/services/grpc-event-publisher.dart';
import 'package:project_tmk_example/infrastructure/services/grpc-event-subscriber.dart';
import 'package:project_tmk_example/ui/pages/splash-screen/splash-screen.page.dart';
import 'package:project_tmk_example/application/shared-state/app.state.dart';
import 'package:project_tmk_example/ui/themes/main.theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final globalAppState = AppState();

  @override
  void initState() {
    super.initState();
    initialiseDependencies();
  }

  void initialiseDependencies() async {
    final publisher = GrpcEventPublisher();
    GetIt.I.registerSingleton<IEventPublisher>(publisher);

    final subscriber = GrpcEventSubscriber();

    subscriber.addSubscriber(
      SendChatEvent.stream["topic"],
      SendChatEvent.stream["action"],
      SendChatEventHandler(globalAppState.chatList),
    );

    subscriber.listenForEvents();

    globalAppState.initialisationFinished();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: globalAppState),
        ChangeNotifierProvider.value(value: globalAppState.activeUser),
        ChangeNotifierProvider.value(value: globalAppState.chatList),
      ],
      child: MaterialApp(
        title: 'Event driven chatting',
        theme: mainTheme,
        home: SplashScreenPage(),
      ),
    );
  }
}
