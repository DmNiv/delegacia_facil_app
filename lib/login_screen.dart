import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username =



  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
