import 'package:delegacia_facil_app/app/data/repositories/delegacia_service/delegacia_service.dart';
import 'package:delegacia_facil_app/app/data/repositories/location_service.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LocationService _locationService = LocationService();
  final DelegaciaService _delegaciaService = DelegaciaService();
  Position? _currentPosition;
  List<Marker> _delegaciaMarkers = [];

  @override
  void initState() {
    super.initState();
    _initializeLocationAndMarkers();
  }

  // Função principal para inicializar localização e buscar delegacias
  Future<void> _initializeLocationAndMarkers() async {
    await _requestLocationPermission();
    await _fetchAndSetDelegaciaMarkers();
  }

  // Função para solicitar permissão de localização
  Future<void> _requestLocationPermission() async {
    try {
      Position position = await _locationService.determinePosition();
      setState(() {
        _currentPosition = position;
      });

      _locationService.getPositionStream().listen((Position position) {
        setState(() {
          _currentPosition = position;
        });
      });
    } catch (e) {
      print('Erro ao obter a localização: $e');
    }
  }

  // Função para buscar delegacias e configurar os marcadores
  Future<void> _fetchAndSetDelegaciaMarkers() async {
    try {
      List<Delegacia> delegacias = await _delegaciaService.getDelegacias();
      _setDelegaciaMarkers(delegacias);
    } catch (e) {
      print('Erro ao buscar as delegacias: $e');
    }
  }

  // Função para criar os marcadores das delegacias
  void _setDelegaciaMarkers(List<Delegacia> delegacias) {
    setState(() {
      _delegaciaMarkers = delegacias.map((delegacia) {
        return Marker(
          point: LatLng(delegacia.latitude, delegacia.longitude),
          child: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40.0,
          ),
        );
      }).toList();
    });
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
                  MarkerLayer(
                    markers: _delegaciaMarkers,
                    // markers: [
                    //   Marker(
                    //       point: LatLng(-1.4338, -48.4639),
                    //       child: Icon(
                    //         Icons.location_on,
                    //         color: Colors.red,
                    //       ))
                    // ],
                  ), // Adicione os marcadores das delegacias
                ],
              ),
      ),
    );
  }
}
