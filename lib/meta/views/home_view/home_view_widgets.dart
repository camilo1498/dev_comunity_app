import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:dev_comunity_app/app/constants/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

Widget bottomAppBar({int index, Function onTap}){
  return CustomNavigationBar(
    strokeColor: yellowColor,
    scaleFactor: 0.2,
    scaleCurve: Curves.bounceIn,
    bubbleCurve: Curves.ease,
    currentIndex: index,
    onTap: onTap,
    selectedColor: yellowColor,
    backgroundColor: darkColor,
    items: [
      CustomNavigationBarItem(
        icon: Icon(EvaIcons.menuOutline),
      ),
      CustomNavigationBarItem(
        icon: Icon(EvaIcons.video),
      ),
      CustomNavigationBarItem(
        icon: Icon(EvaIcons.speaker),
      ),
    ],
  );
}