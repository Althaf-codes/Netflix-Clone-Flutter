import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone/models/user_model.dart';

abstract class AuthRepository {
  Stream<User?> get user;

  Future<UserModel> signup(String email, String password, UserModel usermodel);
  Future<void> setUserData(UserModel user);
  Future<UserModel> signIn(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signout();
}
