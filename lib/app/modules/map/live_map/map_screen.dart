import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';
import 'package:delegacia_facil_app/app/data/providers/delegacia_facil_api_client/delegacia_facil_api_client.provider.dart';
import 'package:delegacia_facil_app/app/modules/map/components/floating_button.dart';
import 'package:delegacia_facil_app/app/modules/map/components/dialog_message.dart';
import 'package:delegacia_facil_app/app/modules/map/components/modal_bottom_sheet.dart';
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
  final BottomSheets _bottomSheet = BottomSheets();
  final apiClient = DelegaciaFacilApiClient();
  final DelegaciaRepository _delegaciaService =
      DelegaciaRepository.defaultClient();
  Position? _currentPosition;
  List<Marker> _delegaciaMarkers = [];
  String erro = '';

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    _loadDelegacias();
  }

  // isso fica aqui
  Future<void> requestLocationPermission() async {
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
      erro = e.toString();
      print('Erro ao obter a localização: $e');
      showDialogMessage(context, "Erro ao obter a localização");
    }
  }

  Future<void> _loadDelegacias() async {
    try {
      final delegacias = await _delegaciaService.getDelegacias();

      // ignore: unnecessary_null_comparison
      if (delegacias != null && delegacias.isNotEmpty) {
        setState(() {
          _delegaciaMarkers = delegacias.map((delegacia) {
            return Marker(
              point: LatLng(delegacia.latitude, delegacia.longitude),
              width: 40,
              height: 40,
              child: IconButton(
                icon: Icon(
                  Icons.shield,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                onPressed: () {
                  _bottomSheet.showDelegaciaBottomSheet(context, delegacia);
                },
              ),
            );
          }).toList();
        });
      } else {
        print("Nenhuma delegacia encontrada.");
      }
    } catch (e) {
      print("Erro ao carregar as delegacias: $e");
      showDialogMessage(context, "Erro ao carregar as delegacias.");
    }
  }

  void _toggleFilters() {
    _bottomSheet.showFilterBottomSheet(
      context,
      removerFiltros: TextButton(
        onPressed: () {
          print("botao remover filtros");
          _resetFilters();
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
            textStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary, fontSize: 16)),
        child: const Text('Remover Filtros'),
      ),
      aplicarFiltros: ElevatedButton(
        onPressed: () {
          print("botao aplicar filtros");
          _applyFilters();
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
        child: const Text('Aplicar Filtros'),
      ),
    );
  }

  Future<void> _applyFilters() async {
    try {
      List<Delegacia> delegacias;

      if (_bottomSheet.diaTodo) {
        delegacias = await _delegaciaService.getDelegacias24h(true);
        setState(() {
          _delegaciaMarkers = delegacias.map((delegacia) {
            return Marker(
              point: LatLng(delegacia.latitude, delegacia.longitude),
              width: 40,
              height: 40,
              child: IconButton(
                icon: Icon(
                  Icons.shield_moon_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                onPressed: () {
                  _bottomSheet.showDelegaciaBottomSheet(context, delegacia);
                },
              ),
            );
          }).toList();
        });
      } else {
        delegacias = await _delegaciaService.getDelegacias();
        setState(() {
          _loadDelegacias();
        });
      }
    } catch (e) {
      print("Erro ao aplicar os filtros: $e");
      showDialogMessage(context, "Erro ao aplicar os filtros.");
    }
  }

  void _resetFilters() async {
    setState(() {
      _bottomSheet.diaTodo = false;
      _bottomSheet.tiposSelecionados = {
        'Mulher': false,
        'Idoso': false,
        'PCD': false,
      };
    });
    _loadDelegacias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Delegacia Fácil",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 28.8),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "AB",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surfaceTint,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
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
                      Text(erro,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary))
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
                          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
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
                            markerSize: Size(25, 25),
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
          DelegaciaVirtual(),
          BotaoPanico(context),
          Positioned(
            bottom: 90,
            right: 16,
            child: FloatingActionButton(
              onPressed: () async {
                await requestLocationPermission();
                _mapController.move(
                  LatLng(
                    _currentPosition!.latitude,
                    _currentPosition!.longitude,
                  ),
                  18,
                );
              },
              child: const Icon(Icons.my_location),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
                onPressed: _toggleFilters,
                child: const Icon(Icons.filter_list)),
          ),
        ],
      ),
    );
  }
}
