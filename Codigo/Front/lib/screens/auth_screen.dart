import 'package:exemplo/models/auth_data.dart';
import 'package:exemplo/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void _handleSubmit(AuthData authData) {
    print(authData.name);
    print(authData.email);
    print(authData.password);
    print(authData.fisioterapeuta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: AuthForm(_handleSubmit),
    );
  }
}
