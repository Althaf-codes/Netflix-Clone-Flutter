// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class MyVideoPlayer extends StatefulWidget {
//   const MyVideoPlayer({super.key});

//   @override
//   State<MyVideoPlayer> createState() => _MyVideoPlayerState();
// }

// class _MyVideoPlayerState extends State<MyVideoPlayer> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://vodoutputs.s3.ap-south-1.amazonaws.com/assets/73430501-6652-4dd9-a792-84b0486f054c/HLS/vod-test1.m3u8'))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
// }
