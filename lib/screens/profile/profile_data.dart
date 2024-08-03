import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Text(
            'Nome',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Nome Sobrenome',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Email',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'email@email.com',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Tefelone',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '(91) 99999-9999',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Data de nascimento',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '00/00/0000',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Sexo',
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Sexo do mano',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
