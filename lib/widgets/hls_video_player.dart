// import 'package:flutter/material.dart';
// import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
// import 'package:netflix_clone/constant/assets.dart';

// class HlsVideoPlayer extends StatefulWidget {
//   const HlsVideoPlayer({super.key});

//   @override
//   State<HlsVideoPlayer> createState() => _HlsVideoPlayerState();
// }

// class _HlsVideoPlayerState extends State<HlsVideoPlayer> {
//   bool fullscreen = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Material App',
//       home: Scaffold(
//         appBar: fullscreen == false
//             ? AppBar(
//                 backgroundColor: Colors.blue,
//                 title: const Image(
//                   image: AssetImage(Assets.netflixLogo),
//                   fit: BoxFit.fitHeight,
//                   height: 50,
//                 ),
//                 centerTitle: true,
//                 leading: IconButton(
//                   icon: const Icon(Icons.arrow_back),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               )
//             : null,
//         body: Padding(
//           padding:
//               fullscreen ? EdgeInsets.zero : const EdgeInsets.only(top: 32.0),
//           child: YoYoPlayer(
//             aspectRatio: 16 / 9,
//             url:
//                 // 'https://dsqqu7oxq6o1v.cloudfront.net/preview-9650dW8x3YLoZ8.webm',
//                 // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
//                 "https://vodoutputs.s3.ap-south-1.amazonaws.com/assets/73430501-6652-4dd9-a792-84b0486f054c/HLS/vod-test1.m3u8",
//             //"https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
//             allowCacheFile: false,
//             // onCacheFileCompleted: (files) {
//             //   print('Cached file length ::: ${files?.length}');

//             //   if (files != null && files.isNotEmpty) {
//             //     for (var file in files) {
//             //       print('File path ::: ${file.path}');
//             //     }
//             //   }
//             // },
//             // onCacheFileFailed: (error) {
//             //   print('Cache file error ::: $error');
//             // },
//             videoStyle: const VideoStyle(
//               qualityStyle: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//               forwardAndBackwardBtSize: 30.0,
//               playButtonIconSize: 40.0,
//               playIcon: Icon(
//                 Icons.add_circle_outline_outlined,
//                 size: 40.0,
//                 color: Colors.white,
//               ),
//               pauseIcon: Icon(
//                 Icons.remove_circle_outline_outlined,
//                 size: 40.0,
//                 color: Colors.white,
//               ),
//               videoQualityPadding: EdgeInsets.all(5.0),
//               // showLiveDirectButton: true,
//               // enableSystemOrientationsOverride: false,
//             ),
//             videoLoadingStyle: const VideoLoadingStyle(
//               loading: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image(
//                       image: AssetImage(Assets.netflixLogo),
//                       fit: BoxFit.fitHeight,
//                       height: 50,
//                     ),
//                     SizedBox(height: 16.0),
//                     Text("Loading video..."),
//                   ],
//                 ),
//               ),
//             ),
//             onFullScreen: (value) {
//               setState(() {
//                 if (fullscreen != value) {
//                   fullscreen = value;
//                 }
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
