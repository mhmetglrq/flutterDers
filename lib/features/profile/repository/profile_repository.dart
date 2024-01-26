import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider((ref) => const ProfileRepository());

class ProfileRepository {
  const ProfileRepository();

  Future<int> likePost(int likeCount) async {
    int finalLikeCount = likeCount++;
    return finalLikeCount;
  }

  Future<void> getLikeCount() async {}
}
