import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../user/user_profile/profile_view.dart';
import '../../../data/repositories/location_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LocationService _locationService = LocationService();
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    try {
      Position position = await _locationService.determinePosition();
      setState(() {
        _currentPosition = position;
      });

      // Iniciar a escuta de mudanças na posição
      _locationService.getPositionStream().listen((Position position) {
        setState(() {
          _currentPosition = position;
        });
      });
    } catch (e) {
      // Se o usuário negar a permissão, você pode mostrar uma mensagem ou lidar com isso de outra forma
      print('Erro ao obter a localização: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "AB",
              style: TextStyle(
                color: Color.fromARGB(255, 130, 105, 173),
                fontSize: 16,
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'DelegaciaFácil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: _currentPosition == null
            ? const CircularProgressIndicator()
            : FlutterMap(
          mapController: MapController(),
          options: MapOptions(
            initialCenter: LatLng(
                _currentPosition!.latitude, _currentPosition!.longitude),
            initialZoom: 18,
          ),
          children: [
            TileLayer(
              urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            CurrentLocationLayer(
              style: const LocationMarkerStyle(
                marker: DefaultLocationMarker(
                  color: Colors.blue,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                markerSize: Size(40, 40),
                markerDirection: MarkerDirection.top,
              ),
            ),
          ],
        ),
      ),
    );
  }
}