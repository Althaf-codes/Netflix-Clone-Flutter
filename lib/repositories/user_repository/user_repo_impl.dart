import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/repositories/user_repository/user_repo_base.dart';
import 'package:netflix_clone/services/user/user_service_base.dart';
import 'package:netflix_clone/services/user/user_services_impl.dart';

class UserRepoImpl extends BaseUserRepo {
  final BaseUserService _baseUserService = UserServices();
  @override
  Future<UserModel> createUser(
      {required String email,
      required String uid,
      required String username,
      required Preferences preference}) async {
    dynamic response = await _baseUserService.createUser(
        email: email, uid: uid, username: username, preference: preference);

    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> getUser(
      {required String email, required String uid}) async {
    UserModel userModel =
        await _baseUserService.getUser(uid: uid, email: email);
    return userModel;
  }

  @override
  Future<UserModel> updateWatchHistory(
      {required String email,
      required String uid,
      required WatchHistory watchHistory}) async {
    dynamic response = await _baseUserService.updateWatchHistory(
        email: email, uid: uid, watchHistory: watchHistory);
    UserModel usermodel = UserModel.fromMap(response as Map<String, dynamic>);
    return usermodel;
  }
}
