import 'package:flutter/material.dart';
import 'package:project_tmk_example/ui/pages/login/login.page.dart';
import 'package:project_tmk_example/application/shared-state/app.state.dart';
import 'package:project_tmk_example/ui/themes/main.theme.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  AppState _globalState;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _globalState = Provider.of<AppState>(context);
      _globalState.addListener(onGlobalStateChange);

      // Trigger manually in case the app has already initialized it's state
      onGlobalStateChange();
    });
  }

  // redirect to login page when state is initialized
  void onGlobalStateChange() {
    if (_globalState.initialised) {
      Future.delayed(
        const Duration(milliseconds: 200),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(mainColor),
        ),
      ),
    );
  }
}
