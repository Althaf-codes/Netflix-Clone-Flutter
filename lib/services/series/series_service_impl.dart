import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/constant/network.dart';

import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/services/exception/app_exception.dart';
import 'package:netflix_clone/services/series/series_service.dart';
import 'package:netflix_clone/utils/error_handler.dart';

class SeriesServiceImpl extends SeriesService {
  @override
  Future<dynamic> getSeries({required int pageNo}) async {
    try {
      final uri = Uri.parse("${NetworkConstants.videoRoute}/series")
          .replace(queryParameters: {"page": pageNo.toString()});

      print("THE URI IS ${uri}");

      http.Response res = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final response = returnResponse(res) as List;

      print('THE SERIES RES is ${response}');

      return response;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
  }
}
