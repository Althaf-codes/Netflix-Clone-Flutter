import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/firebase_options.dart';
import 'package:netflix_clone/main/main_screen.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repo_impl.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';
import 'package:netflix_clone/screens/auth/toggle.dart';
import 'package:netflix_clone/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp(
    authRepository: FirebaseAuthRepository(),
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  const MyApp({super.key, required this.authRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.black,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RepositoryProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(authRepository: authRepository),
          child: AuthWrapper(),
        ) //ChewieDemo() // MyVideoPlayer()  //HlsVideoPlayer()
        //MainScreen() // const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return BlocProvider(
            create: (context) => SignInBloc(
                authRepository:
                    context.read<AuthenticationBloc>().authRepository),
            child: MainScreen(),
          );
        } else {
          return Toggle();
        }
      },
    ));
  }
}
