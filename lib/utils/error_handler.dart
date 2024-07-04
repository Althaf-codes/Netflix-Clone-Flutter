import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/services/exception/app_exception.dart';
import 'package:netflix_clone/widgets/snackbar.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();

    case 400:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['message']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}

dynamic returnResponse(http.Response response) {
  if (kDebugMode) {
    print(response.statusCode);
  }

  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      print("THE RESPONSE in ERROR_HANDLER : ${responseJson}");
      return responseJson['data']['data'];

    case 400:
      throw BadRequestException(response.body.toString());

    case 401:
      throw BadRequestException(response.body.toString());

    case 404:
      throw UnauthorisedException(response.body.toString());
    default:
      throw FetchDataException('Error occured while communicating with server');
  }
}
