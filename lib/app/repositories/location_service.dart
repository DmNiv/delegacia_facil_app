import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Teste se os serviços de localização estão habilitados.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Serviços de localização não habilitados. Não continue.
      return Future.error('Serviços de localização estão desabilitados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissões estão negadas.
        return Future.error('Permissão de localização negada');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissões estão negadas permanentemente.
      return Future.error(
          'Permissão de localização permanentemente negada, não podemos requerer permissões.');
    }

    // Quando as permissões são concedidas, obtenha a posição atual.
    return await Geolocator.getCurrentPosition();
  }

  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter:
            10, // Receba atualizações quando o dispositivo se mover pelo menos 10 metros.
      ),
    );
  }
}
