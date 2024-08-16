import 'package:dio/dio.dart';

class DelegaciaService {
  final Dio _dio = Dio();

  Future<List<Delegacia>> getDelegacias() async {
    final response = await _dio.get('http://localhost:8080/delegacias/');
    return (response.data as List).map((json) => Delegacia.fromJson(json)).toList();
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

  factory Delegacia.fromJson(Map<String, dynamic> json) {
    return Delegacia(
      id: json['id'],
      nome: json['nome'],
      endereco: json['endereco'],
      tipo: json['tipo'],
      horario24h: json['horario24h'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
