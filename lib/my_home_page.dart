import 'package:flutter/material.dart';
import 'auth_service.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() async {
    await _authService.register(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  void _signIn() async {
    await _authService.signIn(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            ElevatedButton(onPressed: _register, child: Text('Register')),
            ElevatedButton(onPressed: _signIn, child: Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
