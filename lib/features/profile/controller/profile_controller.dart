import 'package:flutter_application_1/features/profile/repository/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider = Provider((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);
  return ProfileController(profileRepository: profileRepository);
});

class ProfileController {
  final ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});

  Future<int> likePost(int likeCount) async {
    return profileRepository.likePost(likeCount);
  }
}
