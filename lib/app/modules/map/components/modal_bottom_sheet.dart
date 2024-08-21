import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';
import 'package:delegacia_facil_app/app/data/repositories/url_service.dart';
import 'package:flutter/material.dart';

class BottomSheets {
  final UrlService _urlService = UrlService();

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
                        "Horário de funcionamento: ${delegacia.diaTodo}",
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
}
