import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200.0,
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.deepPurple,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          "AB",
          style: TextStyle(
            color: Color.fromARGB(255, 130, 105, 173),
            fontSize: 64,
          ),
        ),
      ),
    );
  }
}
