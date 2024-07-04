import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/constant/network.dart';
import 'package:netflix_clone/models/video_model.dart';
import 'package:netflix_clone/services/exception/app_exception.dart';
import 'package:netflix_clone/services/video_service/video_service.dart';
import 'package:netflix_clone/utils/error_handler.dart';

class VideoServiceImpl extends VideoService {
  @override
  Future<Video> getVideo({required String videoId}) async {
    try {
      final uri = Uri.parse("${NetworkConstants.videoRoute}/getvideo/$videoId");

      print("THE URI IS ${uri}");

      http.Response res = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final response = returnResponse(res) as List;

      print('THE VIDEO GETBY ID RES is ${response}');
      List<Video> video = response
          .map((ele) => Video.fromMap(ele as Map<String, dynamic>))
          .toList();
      print("THE VIDEO MODEL IS ${video[0].id}");
      return video[0];
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
  }
}
