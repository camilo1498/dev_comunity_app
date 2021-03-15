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
    title: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: bgColorFaint,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(titleText),
      )
    ),
    actions: actions
  );
}