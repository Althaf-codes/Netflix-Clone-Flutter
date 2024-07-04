import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/services/user/user_service_base.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final BaseUserService baseUserService;
  UserModel? currentUser;
  UserBloc({required this.baseUserService}) : super(UserInitial()) {
    // on<CreateUser>(_createuser);
    on<GetUser>(_getuser);
    on<UpdateWatchHistory>(_updateWatchHistory);
  }

  FutureOr<void> _getuser(GetUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());

      print("the user data are ${event.email} and ${event.uid}");
      UserModel userModel =
          await baseUserService.getUser(uid: event.uid, email: event.email);
      currentUser = userModel;
      print("the user model is ${userModel.preferences}");
      emit(UserLoaded(userModel: currentUser!));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  FutureOr<void> _updateWatchHistory(
      UpdateWatchHistory event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      print("THE UPDATE WATCHHISTORY CALLED");

      currentUser = await baseUserService.updateWatchHistory(
          email: event.email, uid: event.uid, watchHistory: event.watchHistory);

      print("the updated current user is ${currentUser}");
      emit(UserLoaded(userModel: currentUser!));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }
}




  // FutureOr<void> _createuser(CreateUser event, Emitter<UserState> emit) async {
  //   try {
  //     emit(UserLoading());

  //     UserModel userModel = await baseUserService.createUser(
  //         email: event.email,
  //         uid: event.uid,
  //         username: event.username,
  //         preference: event.preferences);

  //     // state.userModel = userModel;
  //     emit(UserLoaded(userModel: userModel));
  //   } on Exception catch (e) {
  //     emit(UserFailure(message: e.toString()));
  //   }
  // }