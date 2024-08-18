import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          radius: 60.0,
          child: Text(
            "AB",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 56,
            ),
          ),
        ),
      ),
    );
  }
}
