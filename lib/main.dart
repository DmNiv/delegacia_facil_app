import 'package:delegacia_facil_app/app/modules/map/live_map/map_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_edit_profile/edit_profile_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_login/login_screen.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_view.dart';
import 'package:delegacia_facil_app/app/modules/user/user_sign_up/sign_up_screen.dart';
import 'package:delegacia_facil_app/app/app_theme/theme.dart';
import 'package:delegacia_facil_app/app/app_theme/util.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignUpScreen(),
//     );
//   }
// }

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
      initialRoute: "/",
      routes: {
        // '/splash': (context) => SplashScreen(),
        '/': (context) => LoginScreen(),
        '/cadastro':(context) => SignUpScreen(),
        '/home': (context) => MapScreen(),
        '/profile': (context) => ProfileScreen(),
        '/edit-profile': (context) => EditProfileScreen(),
      },
    );
  }
}
