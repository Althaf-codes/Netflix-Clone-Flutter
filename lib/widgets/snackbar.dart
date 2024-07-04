import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        content: Text(
          msg,
          style: const TextStyle(color: Colors.black),
        )));
}
