import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:netflix_clone/constant/network.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/services/exception/app_exception.dart';
import 'package:netflix_clone/services/recentMovies/recent_movie.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/utils/error_handler.dart';

class RecentMovieServiceImpl extends RecentMovieService {
  @override
  Future<List<Poster>> getRecentMovies({required int pageNo}) async {
    try {
      final uri = Uri.parse("${NetworkConstants.videoRoute}/recent")
          .replace(queryParameters: {'page': pageNo.toString()});

      print("THE URI IS ${uri}");

      http.Response res = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final response = returnResponse(res) as List;
      if (kDebugMode) {
        print("the responses are $response");
      }

      List<Poster> poster = response
          .map((res) => Poster.fromMap(res as Map<String, dynamic>))
          .toList();
      return poster;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
  }
}
