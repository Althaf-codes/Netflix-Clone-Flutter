import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository({FirebaseAuth? firebaseauth})
      : _firebaseAuth = firebaseauth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges();
  }

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel.empty;

      userModel =
          userModel.copyWith(email: email, uid: userCredential.user!.uid);

      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signup(
      String email, String password, UserModel usermodel) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      usermodel =
          usermodel.copyWith(email: email, uid: userCredential.user!.uid);
      return usermodel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(UserModel user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
