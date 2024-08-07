import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(color: Colors.deepPurple),
      child: const Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60.0,
          child: Text(
            "AB",
            style: TextStyle(
              color: Color.fromARGB(255, 104, 84, 139),
              fontSize: 56,
            ),
          ),
        ),
      ),
    );
  }
}
