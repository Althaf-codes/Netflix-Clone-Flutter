import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/blocs/genre_movie/genre_movie_bloc.dart';
import 'package:netflix_clone/blocs/recent_movie/recent_movie_bloc.dart';
import 'package:netflix_clone/blocs/series/series_bloc.dart';
import 'package:netflix_clone/blocs/signIn/signin_bloc.dart';
import 'package:netflix_clone/blocs/top10_movie/top10_movie_bloc.dart';
import 'package:netflix_clone/blocs/user/user_bloc.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/screens/home/components/custom_header.dart';
import 'package:netflix_clone/screens/home/custom_appbar.dart';
import 'package:netflix_clone/widgets/movie_card.dart';
import 'package:netflix_clone/widgets/movie_detail_screen.dart';
import 'package:netflix_clone/widgets/movie_listview.dart';
import 'package:netflix_clone/widgets/snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;
  late ScrollController _scrollController;
  late ScrollController _scrollController1;
  late ScrollController _top10ScrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });

    _scrollController1 = ScrollController();
    _top10ScrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController1.dispose();
    _top10ScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.black,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: CustomAppbar(scrollOffset: _scrollOffset),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserFailure) {
                print("The Failure in USER_BLOC :${state.message}  ");
                showSnackBar(context, state.message);
              }
            },
          ),
          BlocListener<RecentMovieBloc, RecentMovieBlocState>(
            listener: (context, state) {
              if (state is RecentMovieBlocFailure) {
                print("The Failure in RECENTMOVIE_BLOC :${state.message}  ");

                showSnackBar(context, state.message);
              }
            },
          ),
          BlocListener<Top10MovieBloc, Top10MovieState>(
              listener: (context, state) {
            if (state is Top10MovieFailure) {
              print("The Failure in TOP10MOVIE_BLOC :${state.message}  ");

              showSnackBar(context, state.message);
            }
          }),
          BlocListener<GenreMovieBloc, GenreMovieState>(
              listener: (context, state) {
            if (state is GenreMovieFailure) {
              print("The Failure in GENRE_BLOC :${state.message}  ");

              showSnackBar(context, state.message);
            }
          }),
          BlocListener<SeriesBloc, SeriesState>(listener: (context, state) {
            if (state is SeriesFailure) {
              print("The Failure in SERIES_BLOC :${state.message}  ");

              showSnackBar(context, state.message);
            }
          })
        ],
        child: CustomScrollView(
          // shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          controller: _scrollController,
          slivers: [
            const SliverToBoxAdapter(
              child: Header(),
            ),

            // SliverToBoxAdapter(
            //   child: Container(
            //     color: Colors.blue,
            //     width: MediaQuery.of(context).size.width,
            //     height: 700,
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 15,
            //   ),
            // ),

            // SliverToBoxAdapter(
            //   child: Builder(builder: (context) {
            //     return ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             backgroundColor: AppColor.redDark1),
            //         onPressed: () async {
            //           context.read<SignInBloc>().add(SignOutRequired());
            //         },
            //         child: const Text(
            //           "Log Out",
            //           style: TextStyle(color: Colors.white),
            //         ));
            //   }),
            // ),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                child: Text(
                  'Recent Release',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            BlocBuilder<RecentMovieBloc, RecentMovieBlocState>(
              builder: (context, state) {
                if (state is RecentMovieBlocLoading) {
                  return const SliverToBoxAdapter(
                      child: CircularProgressIndicator());
                } else if (state is RecentMovieBlocLoaded) {
                  return SliverToBoxAdapter(
                      child: MovieListview(
                          scrollController: _scrollController1,
                          posters: state.posters));
                }
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                child: Text(
                  'Top picks for Althaf',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),

            BlocBuilder<Top10MovieBloc, Top10MovieState>(
                builder: (context, state) {
              if (state is Top10MovieLoading) {
                return const SliverToBoxAdapter(
                    child: CircularProgressIndicator());
              } else if (state is Top10MovieLoaded) {
                return SliverToBoxAdapter(
                  child: MovieListview(
                      scrollController: _top10ScrollController,
                      posters: state.posters),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                child: Text(
                  'Latest Series',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            BlocBuilder<SeriesBloc, SeriesState>(builder: (context, state) {
              if (state is SeriesLoading) {
                return const SliverToBoxAdapter(
                    child: CircularProgressIndicator());
              } else if (state is SeriesLoaded) {
                return SliverToBoxAdapter(
                  child: MovieListview(
                      scrollController: _top10ScrollController,
                      posters: state.posters),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                child: Text(
                  'Watch from your preferences',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            BlocBuilder<GenreMovieBloc, GenreMovieState>(
                builder: (context, state) {
              if (state is GenreMovieLoading) {
                return const SliverToBoxAdapter(
                    child: CircularProgressIndicator());
              } else if (state is GenreMovieLoaded) {
                return SliverToBoxAdapter(
                  child: MovieListview(
                      scrollController: _top10ScrollController,
                      posters: state.poster),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            })
            // SliverToBoxAdapter(
            //   child: Container(
            //     // color: Colors.green,
            //     height: 200,
            //     width: MediaQuery.of(context).size.width,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: ListView.builder(
            //         controller: _scrollController1,
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemCount: 8,
            //         itemBuilder: (context, index) {
            //           return GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => MovieDetailScreen()));
            //             },
            //             child: Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: MovieCard(
            //                 url:
            //                     'https://assets-global.website-files.com/6009ec8cda7f305645c9d91b/6408f6e7b5811271dc883aa8_batman-min.png',
            //                 height: 150,
            //                 width: 150,
            //                 // 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/adventure-movie-poster-template-design-7b13ea2ab6f64c1ec9e1bb473f345547_screen.jpg?ts=1636999411'
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
