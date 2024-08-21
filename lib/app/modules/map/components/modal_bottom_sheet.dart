import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';
import 'package:delegacia_facil_app/app/data/repositories/url_service.dart';
import 'package:flutter/material.dart';

class BottomSheets {
  final UrlService _urlService = UrlService();
  bool diaTodo = false;
  Map<String, bool> tiposSelecionados = {
    'Mulher': false,
    'Idoso': false,
    'PCD': false,
  };

  void showDelegaciaBottomSheet(BuildContext context, Delegacia delegacia) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return FractionallySizedBox(
          widthFactor: 1.0,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(delegacia.nome,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
                const SizedBox(height: 8),
                Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4),
                    child: Text("Endereço: ${delegacia.endereco}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer))),
                Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                        delegacia.diaTodo
                            ? "Horário de Funcionamento: 24h"
                            : "Horário de Funcionamento: 8h - 18h",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.phone),
                        label: const Text("Ligar"),
                        onPressed: () {
                          _urlService.ligarDelegacia(
                              context, delegacia.telefone);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            _urlService.launchURL(delegacia.mapUrl),
                        icon: const Icon(Icons.explore),
                        label: const Text('Rota'),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          textStyle: Theme.of(context).textTheme.labelLarge,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showFilterBottomSheet(BuildContext context,
      {required TextButton removerFiltros,
      required ElevatedButton aplicarFiltros}) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Filtros',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: Text(
                      'Delegacias 24h',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                    value: diaTodo,
                    onChanged: (bool value) {
                      setState(() {
                        diaTodo = value;
                      });
                    },
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                  ),
                  CheckboxListTile(
                    title: Text('Delegacia da Mulher',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                    value: tiposSelecionados['Mulher'],
                    onChanged: (bool? value) {
                      setState(() {
                        tiposSelecionados['Mulher'] = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Delegacia do Idoso',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                    value: tiposSelecionados['Idoso'],
                    onChanged: (bool? value) {
                      setState(() {
                        tiposSelecionados['Idoso'] = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Delegacia PCD',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer)),
                    value: tiposSelecionados['PCD'],
                    onChanged: (bool? value) {
                      setState(() {
                        tiposSelecionados['PCD'] = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      removerFiltros,
                      const SizedBox(width: 20),
                      aplicarFiltros
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
