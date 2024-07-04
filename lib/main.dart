import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/blocs/genre_movie/genre_movie_bloc.dart';
import 'package:netflix_clone/blocs/recent_movie/recent_movie_bloc.dart';
import 'package:netflix_clone/blocs/series/series_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/blocs/signup/signup_bloc.dart';
import 'package:netflix_clone/blocs/top10_movie/top10_movie_bloc.dart';
import 'package:netflix_clone/blocs/user/user_bloc.dart';
import 'package:netflix_clone/blocs/video/video_bloc.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/firebase_options.dart';
import 'package:netflix_clone/main/main_screen.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repo_impl.dart';
import 'package:netflix_clone/repositories/auth_repository/auth_repository.dart';
import 'package:netflix_clone/repositories/getByGenre/movie_by_genre_repo_impl.dart';
import 'package:netflix_clone/repositories/recent_movie_repository/recent_movie_repo_impl.dart';
import 'package:netflix_clone/repositories/series_repository/series_repo_impl.dart';
import 'package:netflix_clone/repositories/top10_repository/top10_movie_repo_impl.dart';
import 'package:netflix_clone/repositories/user_repository/user_repo_impl.dart';
import 'package:netflix_clone/repositories/video_repo/video_repo_impl.dart';
import 'package:netflix_clone/screens/auth/toggle.dart';
import 'package:netflix_clone/services/user/user_service_base.dart';
import 'package:netflix_clone/services/user/user_services_impl.dart';
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
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<AuthenticationBloc>(
              create: (context) =>
                  AuthenticationBloc(authRepository: authRepository),
            ),
            RepositoryProvider<UserBloc>(
                create: (context) => UserBloc(baseUserService: UserServices())),
            RepositoryProvider<SignUpBloc>(
              create: (context) => SignUpBloc(
                  authRepository: authRepository, userRepo: UserRepoImpl()),
            ),
            RepositoryProvider<VideoBloc>(
                create: (context) => VideoBloc(videoRepo: VideoRepoImpl())),
          ],
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
          return MultiBlocProvider(
            providers: [
              BlocProvider<SignInBloc>(
                create: (BuildContext context) => SignInBloc(
                    authRepository:
                        context.read<AuthenticationBloc>().authRepository,
                    userRepo: UserRepoImpl()),
              ),
              BlocProvider(
                create: (context) => UserBloc(
                    baseUserService: context.read<UserBloc>().baseUserService)
                  ..add(GetUser(
                      email: context.read<AuthenticationBloc>().usermodel.email,
                      uid: context.read<AuthenticationBloc>().usermodel.uid)),
              ),
              BlocProvider(
                  create: (context) =>
                      RecentMovieBloc(recentMovieRepo: RecentMovieRepoImpl())
                        ..add(GetRecentMovies(page: 1))),
              BlocProvider(
                  create: (context) =>
                      Top10MovieBloc(top10movieRepo: Top10MovieRepoImpl())
                        ..add(GetTop10Movies())),
              BlocProvider(
                  create: (context) =>
                      GenreMovieBloc(movieByGenreRepo: MovieByGenreRepoImpl())
                        ..add(GetMovieByGenre(
                            genre: context
                                .read<AuthenticationBloc>()
                                .usermodel
                                .preferences
                                .genres,
                            pageNo: 1))),
              BlocProvider(
                  create: (context) => SeriesBloc(seriesRepo: SeriesRepoImpl())
                    ..add(const GetSeries(pageNo: 1))),
            ],
            child: MainScreen(),
          );
        } else {
          return Toggle();
        }
      },
    ));
  }
}
