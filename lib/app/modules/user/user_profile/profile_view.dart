import 'package:delegacia_facil_app/app/modules/user/user_edit_profile/edit_profile_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_data.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_icon.dart';
import 'package:delegacia_facil_app/app/modules/map/live_map/map_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MapScreen()));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Perfil",
          style: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()));
          },
            icon: const Icon(
              Icons.edit_rounded,
              color: Colors.white,
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
