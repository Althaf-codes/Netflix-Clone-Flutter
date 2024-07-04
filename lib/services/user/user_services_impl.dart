import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:netflix_clone/constant/network.dart';
import 'package:netflix_clone/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/services/exception/app_exception.dart';
import 'package:netflix_clone/services/user/user_service_base.dart';
import 'package:netflix_clone/utils/error_handler.dart';

class UserServices extends BaseUserService {
  Future<UserModel> createUser(
      {required String email,
      required String uid,
      required String username,
      required Preferences preference}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${NetworkConstants.userRoute}/create-user'),
        body: jsonEncode({
          "username": username,
          "email": email,
          "uid": uid,
          "preferences": preference.toMap()
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      var response = returnResponse(res);

      if (kDebugMode) {
        print(response);
      }
      UserModel usermodel = UserModel.fromMap(response);

      return usermodel;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
  }

  @override
  Future<UserModel> getUser(
      {required String uid, required String email}) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${NetworkConstants.userRoute}/get-user/$email/$uid'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      var response = returnResponse(res);

      if (kDebugMode) {
        print(response);
      }
      UserModel usermodel = UserModel.fromMap(response as Map<String, dynamic>);

      return usermodel;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
  }

  @override
  Future updateWatchHistory(
      {required WatchHistory watchHistory,
      required String email,
      required String uid}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${NetworkConstants.userRoute}/update-watchHistory'),
        body: <String, dynamic>{
          "email": email,
          "uid": uid,
          "videoId": watchHistory.videoId,
          "progress": watchHistory.progress
        },
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      var response = returnResponse(res);
      print("THE UPDATE WATCHHISTORY CALLED RES ${response}");

      if (kDebugMode) {
        print(response);
      }
      // UserModel usermodel = UserModel.fromMap(response as Map<String, dynamic>);
      return response;
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }
  }
}
