// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignUpSuccess extends SignupState {}

class SignUpFailure extends SignupState {
  final String? message;

  const SignUpFailure({this.message});
}

class SignUpProcessing extends SignupState {}
