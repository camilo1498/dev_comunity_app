import 'package:flutter/material.dart';

Widget loadingWidget() {
  return Center(
    child: SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(

      ),
    ),
  );
}