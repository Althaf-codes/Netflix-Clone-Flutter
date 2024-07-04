// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';
import 'package:netflix_clone/repositories/user_repository/user_repo_base.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;
  final BaseUserRepo userRepo;
  UserModel usermodel = UserModel.empty;
  SignUpBloc({
    required AuthRepository authRepository,
    required this.userRepo,
  })  : _authRepository = authRepository,
        super(SignupInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcessing());
      try {
        //call to firebase
        usermodel = await _authRepository.signup(
            event.email, event.password, event.user);

        //call to backend server
        await userRepo
            .createUser(
          email: event.email,
          uid: usermodel!.uid,
          username: event.username,
          preference: usermodel!.preferences,
        )
            .then(
          (value) {
            emit(SignUpSuccess(usermodel!));
          },
        );
      } on FirebaseAuthException catch (e) {
        emit(SignUpFailure(message: e.message));
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
