import 'package:dev_comunity_app/app/constants/colors.dart';
import 'package:flutter/material.dart';

Widget appBar({
  @required String titleText,
  @required Widget leadingWidget,
  List<Widget> actions
}){
  return AppBar(
    backgroundColor: bgColor,
    leading: leadingWidget,
    title: Text(titleText),
    actions: actions
  );
}