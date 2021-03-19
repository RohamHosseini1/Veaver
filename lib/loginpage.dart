import 'package:flutter/material.dart';
import 'package:hello_world/MockAuthRepository.dart';

class LoginPage extends StatefulWidget {
  final AuthRepository authRepository = MockAuthRepository();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool waiting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: waiting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    waiting = true;
                  });
                  final result = await widget.authRepository.login();
                  setState(() {
                    waiting = false;
                  });
                  if (result) {
                    print('Welcome back (User)!');
                  } else {
                    print('Something went wrong!');
                  }
                },
                child: Text('Login'),
              ),
      ),
    );
  }
}
