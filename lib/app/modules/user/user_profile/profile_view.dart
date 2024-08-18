import 'package:delegacia_facil_app/app/modules/user/user_edit_profile/edit_profile_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_data.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_icon.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          "Perfil",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 28.8),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfileScreen()));
            },
            icon: Icon(
              Icons.edit_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          ProfileIcon(),
          ProfileData(),
        ],
      ),
    );
  }
}
