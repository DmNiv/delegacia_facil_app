//chamada api e tratamentos
import 'package:delegacia_facil_app/app/data/providers/delegacia_facil_api_client/delegacia_facil_api_client.provider.dart';
import 'package:delegacia_facil_app/app/data/repositories/profile/profile_repository.dart';

class UserProfileController {
  String? firstName = "";
  String? lastName = "";

  // @override
  // void onInit(){
  //   super.onInit();
  //   getProfileInfo();
  // }

  Future<void> getProfileInfo() async {
    final apiClient = DelegaciaFacilApiClient();
    final profileRepository = ProfileRepository(apiClient);

    final profileInfo = await profileRepository.getProfileInfo();

    firstName = profileInfo.firstName;
    lastName = profileInfo.lastName;
  }
}