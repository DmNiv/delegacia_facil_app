import 'package:dio/dio.dart';

class DelegaciaService {
  final Dio _dio = Dio();

  Future<List<Delegacia>> getDelegacias() async {
    // final response = await _dio.get('http://localhost:8080/delegacias/');
    final response = await _dio.get(
        'https://304a-2804-14c-598f-89b1-2d79-a105-89a1-c93e.ngrok-free.app/delegacias');
    print(response.data);
    return (response.data as List)
        .map((map) => Delegacia.fromMap(map))
        .toList();
  }
}

class Delegacia {
  final int id;
  final String nome;
  final String endereco;
  final String tipo;
  final bool horario24h;
  final double latitude;
  final double longitude;

  Delegacia({
    required this.id,
    required this.nome,
    required this.endereco,
    required this.tipo,
    required this.horario24h,
    required this.latitude,
    required this.longitude,
  });

  factory Delegacia.fromMap(Map<String, dynamic> map) {
    return Delegacia(
      id: map['id'],
      nome: map['nome'],
      endereco: map['endereco'],
      tipo: map['tipo'],
      horario24h: map['horario24h'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
