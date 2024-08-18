import "dart:ui";
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    print("Usuário: $username");
    print("Senha: $password");

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home',
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Delegacia Fácil",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 28.8),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Login",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Não tem cadastro?",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      child: Text(
                        'Cadastre-se já!',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: "Login", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: "Senha", border: OutlineInputBorder()),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Text("Entrar",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
