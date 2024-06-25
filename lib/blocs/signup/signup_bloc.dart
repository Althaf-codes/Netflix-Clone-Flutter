// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;
  SignUpBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignupInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcessing());
      try {
        UserModel user = await _authRepository.signup(
            event.email, event.password, event.user);

        emit(SignUpSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SignUpFailure(message: e.message));
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
