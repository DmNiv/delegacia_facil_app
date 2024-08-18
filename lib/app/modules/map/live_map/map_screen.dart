import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';
import 'package:delegacia_facil_app/app/data/providers/delegacia_facil_api_client/delegacia_facil_api_client.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:delegacia_facil_app/app/data/repositories/delegacia/delegacia_repository.dart';
import 'package:delegacia_facil_app/app/data/repositories/location_service.dart';
import 'package:delegacia_facil_app/app/modules/user/user_profile/profile_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String erro = '';
  bool diaTodo = false;
  Map<String, bool> tiposSelecionados = {
    'Mulher': false,
    'Idoso': false,
    'PCD': false,
  };

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Não foi possível abrir a URL: $url';
    }
  }

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
      erro = e.toString();
      print('Erro ao obter a localização: $e');
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer)),
                              const SizedBox(height: 8),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 4),
                                  child: Text("Endereço: ${delegacia.endereco}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer))),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  child: Text(
                                      "Horário de funcionamento: ${delegacia.diaTodo}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer))),
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () => _launchURL(delegacia.mapUrl),
                                  icon: const Icon(Icons.map_rounded),
                                  label: const Text('Abrir no Google Mapas'),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    foregroundColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 14),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
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
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[200],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                  SwitchListTile(
                    title: const Text('Delegacias 24h'),
                    value: diaTodo,
                    onChanged: (bool value) {
                      setState(() {
                        diaTodo = value;
                      });
                    },
                  ),
                  const Divider(),
                  CheckboxListTile(
                    title: const Text('Delegacia da Mulher'),
                    value: tiposSelecionados['Mulher'],
                    onChanged: (bool? value) {
                      setState(() {
                        tiposSelecionados['Mulher'] = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Delegacia do Idoso'),
                    value: tiposSelecionados['Idoso'],
                    onChanged: (bool? value) {
                      setState(() {
                        tiposSelecionados['Idoso'] = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Delegacia PCD'),
                    value: tiposSelecionados['PCD'],
                    onChanged: (bool? value) {
                      setState(() {
                        tiposSelecionados['PCD'] = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          _resetFilters();
                          Navigator.of(context).pop();
                        },
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16)),
                        child: const Text('Remover Filtros'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          _applyFilters();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                        child: const Text('Aplicar Filtros'),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _applyFilters() async {
    try {
      List<Delegacia> delegacias;

      if (diaTodo) {
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer)),
                              const SizedBox(height: 8),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 4),
                                  child: Text("Endereço: ${delegacia.endereco}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer))),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  child: Text(
                                      "Horário de funcionamento: ${delegacia.diaTodo}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer))),
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () => _launchURL(delegacia.mapUrl),
                                  icon: const Icon(Icons.map_rounded),
                                  label: const Text('Abrir no Google Mapas'),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    foregroundColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 14),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
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
      _showErrorDialog("Erro ao aplicar os filtros.");
    }
  }

  void _resetFilters() async {
    setState(() {
      diaTodo = false;
      tiposSelecionados = {
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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
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
                        Text(erro)
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
