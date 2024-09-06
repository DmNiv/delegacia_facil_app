import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 209, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Delegacia Fácil",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Color.fromARGB(255, 114, 0, 176),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset("assets/logo_app.png", height: 120),
            const SizedBox(height: 40),
            Image.asset("assets/logo_prefeitura.png", width: 160),
            const SizedBox(height: 20),
            Image.asset("assets/logo_oficina_futuro.png", width: 160),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo_ufpa.png", height: 80),
                const SizedBox(width: 20),
                Image.asset("assets/logo_facomp.png", height: 80)
              ],
            )
          ],
        ),
      ),
    );
  }
}
