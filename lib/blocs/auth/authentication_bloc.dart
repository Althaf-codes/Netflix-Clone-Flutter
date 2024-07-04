import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  UserModel usermodel = UserModel.empty;

  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc({required this.authRepository})
      : super(AuthenticationState.unknown()) {
    _userSubscription = authRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });

    on<AuthenticationUserChanged>(
      (event, emit) {
        if (event.user != null) {
          emit(AuthenticationState.authenticated(event.user!));
          usermodel = usermodel.copyWith(
              email: event.user!.email, uid: event.user!.uid);
        } else {
          emit(AuthenticationState.unauthenticated());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
