import 'package:dio/dio.dart';
import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';
import 'package:delegacia_facil_app/app/data/repositories/delegacia/delegacia_repository.interface.dart';

class DelegaciaRepository implements IDelegaciaRepository {
  final Dio _dio;

  DelegaciaRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<List<Delegacia>> getDelegacias() async {
    const url =
        'https://9d7e-2804-14c-598f-89b1-2d79-a105-89a1-c93e.ngrok-free.app/delegacias';

    try {
      final response = await _dio.get(url);
      final data = response.data as List;
      return data.map((map) => Delegacia.fromMap(map)).toList();
    } catch (e) {
      throw Exception("Erro ao carregar as delegacias: $e");
    }
  }
}
