import 'package:flutter/material.dart';
import 'auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email: ${_authService.currentUser?.email}"),
            ElevatedButton(
              onPressed: () async {
                // Change password logic
              },
              child: Text("Change Password"),
            ),
            ElevatedButton(
              onPressed: () async {
                await _authService.signOut();
                Navigator.pop(context); // Navigate back to login
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
