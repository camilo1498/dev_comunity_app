import 'package:dev_comunity_app/app/constants/colors.dart';
import 'package:dev_comunity_app/app/constants/dimensions.dart';
import 'package:flutter/material.dart';

Widget countNumOfUsers({@required int numOfUsers}){
  return RichText(
    text: TextSpan(
        text: 'Dev Community',
        style: TextStyle(
            color: yellowColor,
            fontWeight: FontWeight.bold
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'is a community of $numOfUsers Devs',
              style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold
              )
          )
        ]
    ),
  );
}

Widget authButton({
  @required String authProvider,
  @required IconData iconData,
  @required Color color,
  @required Function onPressed
}){
  return GestureDetector(
    onTap: onPressed,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 60,),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, color: whiteColor,),
              hSizedBox1,
              Text(
                'Sign up with $authProvider',
                style: TextStyle(
                  fontSize: 17,
                  color: whiteColor,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}