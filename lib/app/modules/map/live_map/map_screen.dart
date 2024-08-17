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
  final MapController _mapController = MapController();
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
                Icons.local_police_rounded,
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

  void _updateLocation() async {
    await _requestLocationPermission();
    _mapController.move(
      LatLng(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      ),
      18,
    );
  }

  void _toggleFilters() {
    bool _horario24h = false;
    Map<String, bool> _tiposSelecionados = {
      'Mulher': false,
      'Idoso': false,
      'PCD': false,
    };
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[200], // Escurecer o fundo
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Filtros',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Adicione os widgets dos filtros aqui
              SwitchListTile(
                  title: const Text('Delegacias 24h'),
                  value: _horario24h,
                  onChanged: (bool value) {
                    setState(() {
                      _horario24h = true;
                    });
                  }),
              CheckboxListTile(
                title: const Text('Delegacia da Mulher'),
                value: _tiposSelecionados['Mulher'],
                onChanged: (bool? value) {
                  setState(() {
                    _tiposSelecionados['Mulher'] = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Delegacia do Idoso'),
                value: _tiposSelecionados['Idoso'],
                onChanged: (bool? value) {
                  setState(() {
                    _tiposSelecionados['Idoso'] = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Delegacia PCD'),
                value: _tiposSelecionados['PCD'],
                onChanged: (bool? value) {
                  setState(() {
                    _tiposSelecionados['PCD'] = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aqui você aplicaria os filtros e atualizaria a visualização das delegacias
                  Navigator.of(context).pop();
                },
                child: const Text('Aplicar Filtros'),
              ),
            ],
          ),
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
        body: Stack(
          children: [
            Center(
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
                      mapController: _mapController,
                      options: MapOptions(
                          initialCenter: LatLng(
                            _currentPosition!.latitude,
                            _currentPosition!.longitude,
                          ),
                          initialZoom: 18,
                          initialRotation: 0.0,
                          interactionOptions: const InteractionOptions(
                            flags:
                                InteractiveFlag.all & ~InteractiveFlag.rotate,
                          )),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
                          subdomains: const ['a', 'b', 'c', 'd'],
                          retinaMode: true,
                        ),
                        CurrentLocationLayer(
                          style: const LocationMarkerStyle(
                              marker: DefaultLocationMarker(
                                color: Colors.blue,
                              ),
                              markerSize: Size(30, 30),
                              headingSectorRadius: 40),
                        ),
                        MarkerLayer(markers: _delegaciaMarkers),
                      ],
                    ),
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 90,
              right: 16,
              child: FloatingActionButton(
                onPressed: _updateLocation,
                child: const Icon(Icons.my_location),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: _toggleFilters,
                child: const Icon(Icons.filter_list),
              ),
            ),
          ],
        ));
  }
}
