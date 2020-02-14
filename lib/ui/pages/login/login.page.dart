import 'package:flutter/material.dart';
import 'package:project_tmk_example/ui/pages/chat/chat.page.dart';
import 'package:project_tmk_example/application/shared-state/login/user.state.dart';
import 'package:project_tmk_example/ui/themes/main.theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  void login() async {
    // todo set username and redirect
    Provider.of<User>(context).username = _controller.text;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration:
                    InputDecoration(hintText: "Username (max. 20 letters)"),
                maxLength: 20,
                maxLengthEnforced: true,
              ),
              Container(
                height: 16,
              ),
              FlatButton(
                color: mainColor,
                child: Text(
                  "Login",
                ),
                onPressed: login,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
