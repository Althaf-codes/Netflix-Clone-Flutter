// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:netflix_clone/blocs/auth/authentication_bloc.dart';
import 'package:netflix_clone/blocs/user/user_bloc.dart';
import 'package:netflix_clone/blocs/video/video_bloc.dart';
import 'package:netflix_clone/constant/assets.dart';
import 'package:netflix_clone/constant/colors.dart';
import 'package:netflix_clone/constant/my_flutter_app_icons.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/models/user_model.dart';
import 'package:netflix_clone/models/video_model.dart';
import 'package:netflix_clone/screens/home/components/episodes_screen.dart';
import 'package:netflix_clone/screens/home/components/related_videos_screen.dart';
import 'package:netflix_clone/widgets/episode_card.dart';
import 'package:netflix_clone/widgets/horizontal_full_icon_button.dart';
import 'package:netflix_clone/widgets/movie_details_view.dart';
import 'package:netflix_clone/widgets/series_details_view.dart';
import 'package:netflix_clone/widgets/vertical_icon_button.dart';

class MovieDetailScreen extends StatefulWidget {
  String videoId;
  MovieDetailScreen({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // late TabController _controller;
  // late ScrollController _scrollController;

  bool isPlayed = false;
  @override
  void initState() {
    // _scrollController = ScrollController();
    // _controller = TabController(length: 4, vsync: this);
    BlocProvider.of<VideoBloc>(context).add(GetVideo(videoId: widget.videoId));
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () {
            final usermodel =
                BlocProvider.of<AuthenticationBloc>(context, listen: false)
                    .usermodel;

            // print('The email is ${usermodel}');
            print("the isPlayed is ${isPlayed}");

            isPlayed
                ? BlocProvider.of<UserBloc>(context, listen: false).add(
                    UpdateWatchHistory(
                        email: usermodel.email,
                        uid: usermodel.uid,
                        watchHistory: WatchHistory(
                            videoId: widget.videoId,
                            watchedAt: DateTime.now().toString(),
                            progress: 15)))
                : null;

            // BlocProvider.of<UserBloc>(context, listen: false).add(
            //     UpdateWatchHistory(
            //         email: usermodel.email,
            //         uid: usermodel.uid,
            //         watchHistory: WatchHistory(
            //             videoId: widget.videoId,
            //             watchedAt: DateTime.now().toString(),
            //             progress: 15)))

            Navigator.pop(context);
          },
          color: AppColor.grey,
        ),
      ),
      body: BlocListener<VideoBloc, VideoState>(
        listener: (context, state) {
          if (state is VideoFailure) {
            print("The video Failure error is ${state.message}");
          }
        },
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state is VideoLoading) {
              return const CircularProgressIndicator.adaptive();
            } else if (state is VideoLoaded) {
              Video currentVideo = state.video;
              DateTime date =
                  new DateFormat("yyyy").parse(currentVideo.releaseDate);
              print("THE DATE IS ${date}");

              if (currentVideo.videoType == "Movie") {
                return MovieDetailsView(
                    currentVideo: currentVideo,
                    date: date,
                    ontapPlay: () {
                      setState(() {
                        isPlayed = true;
                      });
                    });
              } else {
                return SeriesDetailsView(
                    currentVideo: currentVideo,
                    date: date,
                    ontapPlay: () {
                      setState(() {
                        isPlayed = true;
                      });
                    });
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

//   int _selectedIndex = 0;

//   Widget _buildTabBar({required bool hasSeason}) {
//     return Row(
//       // mainAxisAlignment: MainAxisAlignment.,
//       children: [
//         hasSeason ? _buildTabItem(0, 'Episodes') : const SizedBox.shrink(),
//         hasSeason ? _buildTabItem(1, 'Collection') : const SizedBox.shrink(),
//         _buildTabItem(2, 'More Like This'),
//         _buildTabItem(3, 'Trailers & More'),
//       ],
//     );
//   }

//   Widget _buildTabItem(int index, String label) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           padding: EdgeInsets.only(top: 8),
//           // color: index == _selectedIndex ? Colors.blue : Colors.transparent,
//           height: 30,
//           // width: 60,
//           decoration: BoxDecoration(
//               border: Border(
//                   top: BorderSide(
//                       width: 3,
//                       style: BorderStyle.solid,
//                       color: _selectedIndex == index
//                           ? AppColor.red
//                           : Colors.transparent),
//                   bottom: BorderSide.none,
//                   left: BorderSide.none,
//                   right: BorderSide.none)),
//           child: Text(
//             label,
//             style: TextStyle(
//                 overflow: TextOverflow.ellipsis,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 color:
//                     index == _selectedIndex ? AppColor.white : AppColor.grey),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTabContent(
//       {required List<Season> seasons, required List<Poster> relatedVideos}) {
//     return IndexedStack(
//       index: _selectedIndex,
//       children: [
//         seasons.isNotEmpty
//             ? EpisodesScreen(
//                 seasons: seasons,
//               )
//             : const SizedBox.shrink(),
//         seasons.isNotEmpty
//             ? Center(
//                 child: Text(
//                   'Collection',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500),
//                 ),
//               )
//             : const SizedBox.shrink(),
//         RelatedVideosScreen(relatedVideos: relatedVideos),
//         Center(
//           child: Text(
//             'Trailers & More',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
//           ),
//         )
//       ],
//     );
//   }
}
