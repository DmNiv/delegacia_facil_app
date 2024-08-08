import 'package:delegacia_facil_app/app/data/models/profile.model.dart';
import 'package:delegacia_facil_app/app/data/providers/delegacia_facil_api_client/delegacia_facil_api_client.provider.dart';
import 'profile_repository.interface.dart';
class ProfileRepository implements IProfileRepository{
  final DelegaciaFacilApiClient apiClient;

  ProfileRepository(this.apiClient);

  @override
  Future<Profile> getProfileInfo() async {
    const url = "http://ngrok.bla.bla.bla/api/v1/user-profile"; 

    try {
      final response = await apiClient.get(url);

      final profileInfo = Profile.fromMap(response.data);

      return profileInfo;
    } catch (e) {

      print('Erro ao obter informações do perfil: $e');
      rethrow; 
    }
  }
}
