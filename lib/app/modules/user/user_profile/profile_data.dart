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
            context: context, title: 'Nome', subtitle: 'Name Sobrenome'),
        const Divider(),
        _buildListTile(
          context: context,
          title: 'Email',
          subtitle: 'email@email.com',
        ),
        const Divider(),
        _buildListTile(
          context: context,
          title: 'Telefone',
          subtitle: '(91) 99999-9999',
        ),
        const Divider(),
        _buildListTile(
          context: context,
          title: 'Data de Nascimento',
          subtitle: '01/01/1990',
        ),
        const Divider(),
        _buildListTile(
          context: context,
          title: 'Gênero',
          subtitle: 'Gênero',
        ),
      ],
    );
  }

  ListTile _buildListTile(
      {required BuildContext context,
      required String title,
      required String subtitle}) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600)),
      ),
      subtitle: Text(subtitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildExpansionTile({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
