import 'package:delegacia_facil_app/app/data/providers/delegacia_facil_api_client/delegacia_facil_api_client.provider.dart';
import 'package:delegacia_facil_app/app/data/models/delegacia.model.dart';
import 'package:delegacia_facil_app/app/data/repositories/delegacia/delegacia_repository.interface.dart';

class DelegaciaRepository implements IDelegaciaRepository {
  final DelegaciaFacilApiClient apiClient;

  DelegaciaRepository(this.apiClient);

  DelegaciaRepository.defaultClient() : apiClient = DelegaciaFacilApiClient();

  @override
  Future<List<Delegacia>> getDelegacias() async {
    const url =
        'https://b73f-177-100-88-202.ngrok-free.app/api/v1/delegacias/lista-delegacias';
    final Map<String, dynamic> headers = {'ngrok-skip-browser-warning': 1};
    try {
      final response = await apiClient.get(url, headers: headers);

      final List<dynamic> data = response.data ?? [];

      return data.map((map) => Delegacia.fromMap(map)).toList();
    } catch (e) {
      throw Exception("Erro ao carregar as delegacias: $e");
    }
  }

  @override
  Future<List<Delegacia>> getDelegacias24h(bool diaTodo) async {
    const baseUrl =
        'https://b73f-177-100-88-202.ngrok-free.app/api/v1/delegacias';
    final url = '$baseUrl/filtro?diaTodo=$diaTodo';
    final Map<String, dynamic> headers = {'ngrok-skip-browser-warning': 1};

    try {
      final response = await apiClient.get(url, headers: headers);

      final List<dynamic> data = response.data ?? [];

      return data.map((map) => Delegacia.fromMap(map)).toList();
    } catch (e) {
      throw Exception("Erro ao carregar as delegacias filtradas: $e");
    }
  }
}
