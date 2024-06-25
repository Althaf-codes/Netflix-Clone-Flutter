import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/blocs/signup/signup_bloc.dart';
import 'package:netflix_clone/screens/auth/signin.dart';
import 'package:netflix_clone/screens/auth/signup.dart';

class Toggle extends StatefulWidget {
  const Toggle({Key? key}) : super(key: key);

  @override
  State<Toggle> createState() => _AuthState();

  static String _route = '/toggle';

  static get route => _route;
}

class _AuthState extends State<Toggle> {
  bool showSignUp = true;

  void toggleview() {
    setState(() {
      showSignUp = !showSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignUp) {
      return BlocProvider(
        create: (context) => SignUpBloc(
            authRepository: context.read<AuthenticationBloc>().authRepository),
        child: SignUpScreen(toggleView: toggleview),
      );
    } else {
      return BlocProvider(
        create: (context) => SignInBloc(
            authRepository: context.read<AuthenticationBloc>().authRepository),
        child: SigninScreen(toggleView: toggleview),
      );
    }
  }
}
