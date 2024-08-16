import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';
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
  final DelegaciaRepository _delegaciaService = DelegaciaRepository();
  Position? _currentPosition;
  List<Marker> _delegaciaMarkers = [];

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
      print('Erro ao obter a localização: $e');
    }
  }

  Future<void> _loadDelegacias() async {
    try {
      final delegacias = await _delegaciaService.getDelegacias();
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
      print(_delegaciaMarkers[0].point);
    } catch (e) {
      print("Erro ao carregar as delegacias: $e");
    }
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
            ? const CircularProgressIndicator()
            : FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                  initialCenter: LatLng(
                    _currentPosition!.latitude,
                    _currentPosition!.longitude,
                  ),
                  initialZoom: 18,
                ),
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
