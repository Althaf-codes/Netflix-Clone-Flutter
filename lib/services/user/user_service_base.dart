import 'package:netflix_clone/models/user_model.dart';

abstract class BaseUserService {
  Future<UserModel> createUser(
      {required String email,
      required String uid,
      required String username,
      required Preferences preference});

  Future<UserModel> getUser({required String uid, required String email});

  Future<dynamic> updateWatchHistory(
      {required String email,
      required String uid,
      required WatchHistory watchHistory});
}
