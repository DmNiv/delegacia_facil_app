import 'package:delegacia_facil_app/app/modules/map/components/dialog_message.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

  Future<void> ligarDelegacia(BuildContext context, String telefone) async {
    if (telefone.isEmpty) {
      showDialogMessage(context, "A Delegacia selecionada não possui número.");
    } else {
      final Uri url = Uri(scheme: 'tel', path: telefone);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        print("Não foi possível abrir o discador");
      }
    }
  }
}
