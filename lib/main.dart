import 'package:delegacia_facil_app/app/modules/map/live_map/map_screen.dart';
import 'package:delegacia_facil_app/app/modules/spash_screen/splash_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_edit_profile/edit_profile_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_login/login_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_view.dart';
import 'package:delegacia_facil_app/app/modules/user/user_sign_up/sign_up_screen.dart';
import 'package:delegacia_facil_app/app/app_theme/theme.dart';
import 'package:delegacia_facil_app/app/app_theme/util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Roboto", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      initialRoute: "/splash",
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const LoginScreen(),
        '/cadastro':(context) => const SignUpScreen(),
        '/home': (context) => const MapScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
      },
    );
  }
}
