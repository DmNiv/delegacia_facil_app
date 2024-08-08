import 'profile_repository.interface.dart';

final class ProfileRepository implements IProfileRepository {

  @override
  Future<dynamic> getProfileInfo() async {
    final url = "";

    try {
      // recebera uma chamada get que retonara o perfil do usuario
      // final response = await client.get(url);
      String response = "perfil";


      return response;
    } catch (_) {
      return (valid: false, reason: 'Erro interno durante a requisição', data: null);
    }
  }
}
