import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repo_impl.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';
import 'package:netflix_clone/repositories/user_repository/user_repo_base.dart';

part 'signin_state.dart';
part 'signin_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;
  final BaseUserRepo userRepo;

  UserModel usermodel = UserModel.empty;

  SignInBloc({required AuthRepository authRepository, required this.userRepo})
      : _authRepository = authRepository,
        super(SignInInitial()) {
    on<SignInRequired>(
      (event, emit) async {
        emit(SignInProcessing());
        try {
          //call to firebase
          usermodel = await _authRepository.signIn(event.email, event.password);

          //call to backend server
          await userRepo
              .getUser(
                email: event.email,
                uid: usermodel!.uid,
              )
              .then((value) {});

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
