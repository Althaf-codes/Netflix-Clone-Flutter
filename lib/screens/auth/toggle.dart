import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/blocs/signup/signup_bloc.dart';
import 'package:netflix_clone/blocs/user/user_bloc.dart';
import 'package:netflix_clone/repositories/user_repository/user_repo_impl.dart';
import 'package:netflix_clone/screens/auth/signin.dart';
import 'package:netflix_clone/screens/auth/signup.dart';
import 'package:netflix_clone/services/user/user_services_impl.dart';

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
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignUpBloc(
                authRepository:
                    context.read<AuthenticationBloc>().authRepository,
                userRepo: context.read<SignUpBloc>().userRepo),
          ),
          // BlocProvider(
          //     create: (context) => UserBloc(baseUserService: UserServices()))
        ],
        child: SignUpScreen(toggleView: toggleview),
      );
    } else {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInBloc(
                authRepository:
                    context.read<AuthenticationBloc>().authRepository,
                userRepo: UserRepoImpl()),
          ),
          BlocProvider(
              create: (context) => UserBloc(baseUserService: UserServices()))
        ],
        child: SigninScreen(toggleView: toggleview),
      );
    }
  }
}
