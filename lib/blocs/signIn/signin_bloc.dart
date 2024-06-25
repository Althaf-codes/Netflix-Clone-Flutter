import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repo_impl.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';

part 'signin_state.dart';
part 'signin_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;

  SignInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignInInitial()) {
    on<SignInRequired>(
      (event, emit) async {
        emit(SignInProcessing());
        try {
          await _authRepository.signIn(event.email, event.password);
          emit(SignInSuccess());
        } on FirebaseAuthException catch (e) {
          emit(SignInFailure(message: e.message));
        } catch (e) {
          emit(const SignInFailure());
        }
      },
    );

    on<SignOutRequired>(
      (event, emit) async {
        await _authRepository.signout();
      },
    );
  }
}
