part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  // UserModel userModel;
  // UserState({required this.userModel});

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  // UserInitial({required UserModel userModel})
  // :  super(userModel: userModel);
}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final UserModel userModel;
  UserLoaded({required this.userModel});
}

final class UserFailure extends UserState {
  final String message;

  UserFailure({required this.message});
}
