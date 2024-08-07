import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  // tem que criar essa classe depois para poder implementar o restante
  // final Profile profile;

  // adicionar required this.profile no construtor abaixo
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildListTile(
          title: 'Nome',
          subtitle: 'profile.name profile.surname',
        ),
        const Divider(),
        _buildListTile(
          title: 'Email',
          subtitle: 'profile.email',
        ),
        const Divider(),
        _buildListTile(
          title: 'Telefone',
          subtitle: 'profile.phone',
        ),
        const Divider(),
        _buildListTile(
          title: 'Data de Nascimento',
          subtitle: 'profile.dateOfBith',
        ),
        const Divider(),
        _buildListTile(
          title: 'Sexo',
          subtitle: 'profile.gender',
        ),
      ],
    );
  }

  ListTile _buildListTile({required String title, required String subtitle}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.deepPurple,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
