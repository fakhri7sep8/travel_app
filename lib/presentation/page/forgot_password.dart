import 'package:flutter/material.dart';
import 'package:travel_app/core/useCase/auth.dart';


class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final prossesAuth authService = prossesAuth();
  String message = "";

  void sendForgotPassword() async {
    String response = await authService.forgotPassword(emailController.text);
    setState(() {
      message = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Masukkan Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendForgotPassword,
              child: Text("Kirim Reset Password"),
            ),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
