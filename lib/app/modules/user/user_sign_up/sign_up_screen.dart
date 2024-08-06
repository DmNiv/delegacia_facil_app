import "package:flutter/material.dart";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cellphoneNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedGender;
  late final String birthDate;

  void SignUp() {
    String name = _nameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String cellphoneNumber = _cellphoneNumberController.text;
    String password = _passwordController.text;
    String userGender = _selectedGender ?? "Não especificado";
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Cadastro",
          style: TextStyle(
              color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60.0),
              const Text(
                "Delegacia Fácil",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: "Primeiro nome:", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                    labelText: "Sobrenome:", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: "Gênero",
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Masculino",
                    child: Text("Masculino"),
                  ),
                  DropdownMenuItem(
                    value: "Feminino",
                    child: Text("Feminino"),
                  ),
                  DropdownMenuItem(
                    value: "Outro",
                    child: Text("Outro"),
                  )
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _cellphoneNumberController,
                decoration: const InputDecoration(
                    labelText: "Número de Celular:",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: "Email:", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Senha:",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
