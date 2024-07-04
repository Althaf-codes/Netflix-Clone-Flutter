import 'package:netflix_clone/models/user_model.dart';

abstract class BaseUserRepo {
  Future<UserModel> createUser(
      {required String email,
      required String uid,
      required String username,
      required Preferences preference});

  Future<UserModel> getUser({required String email, required String uid});

  Future<UserModel> updateWatchHistory(
      {required String email,
      required String uid,
      required WatchHistory watchHistory});
}
