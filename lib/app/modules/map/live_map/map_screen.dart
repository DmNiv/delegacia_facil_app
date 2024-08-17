import 'package:delegacia_facil_app/app/data/providers/delegacia_facil_api_client/delegacia_facil_api_client.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:delegacia_facil_app/app/data/repositories/delegacia/delegacia_repository.dart';
import 'package:delegacia_facil_app/app/data/repositories/location_service.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_view.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LocationService _locationService = LocationService();
  final apiClient = DelegaciaFacilApiClient();
  final DelegaciaRepository _delegaciaService =
      DelegaciaRepository.defaultClient();
  Position? _currentPosition;
  List<Marker> _delegaciaMarkers = [];
  String Erro = '';

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _loadDelegacias();
  }

  Future<void> _requestLocationPermission() async {
    try {
      final position = await _locationService.determinePosition();
      setState(() {
        _currentPosition = position;
      });

      _locationService.getPositionStream().listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });
    } catch (e) {
      Erro = e.toString();
      print('Erro ao obter a localização: $e');
    }
  }

  Future<void> _loadDelegacias() async {
    try {
      final delegacias = await _delegaciaService.getDelegacias();

      if (delegacias != null && delegacias.isNotEmpty) {
        setState(() {
          _delegaciaMarkers = delegacias.map((delegacia) {
            return Marker(
              point: LatLng(delegacia.latitude, delegacia.longitude),
              width: 40,
              height: 40,
              child: const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 40,
              ),
            );
          }).toList();
        });
      } else {
        print("Nenhuma delegacia encontrada.");
      }
    } catch (e) {
      print("Erro ao carregar as delegacias: $e");
      _showErrorDialog("Erro ao carregar as delegacias.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: const CircleAvatar(
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
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(Erro)
                ],
              ))
            : FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                    initialCenter: LatLng(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                    ),
                    initialZoom: 18,
                    initialRotation: 0.0,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                    )),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(markers: _delegaciaMarkers),
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
