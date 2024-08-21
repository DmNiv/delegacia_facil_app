import 'package:delegacia_facil_app/app/data/repositories/location_service.dart';
import 'package:delegacia_facil_app/app/data/repositories/url_service.dart';
import 'package:flutter/material.dart';

LocationService _locationService = LocationService();
UrlService _urlService = UrlService();

Widget DelegaciaVirtual() {
  return Positioned(
    top: 120,
    right: 16,
    child: FloatingActionButton(
      onPressed: () => _urlService.launchURL("https://delegaciavirtual.pa.gov.br/#/"),
      child: const Icon(Icons.policy_rounded),
    ),
  );
}

Widget BotaoPanico(BuildContext context) {
  return Positioned(
    top: 194,
    right: 16,
    child: FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.error,
      onPressed: () => _urlService.ligarDelegacia(context, '190'),
      child: Icon(
        Icons.sos,
        color: Theme.of(context).colorScheme.onError,
      ),
    ),
  );
}
