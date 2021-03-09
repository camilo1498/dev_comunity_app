import 'package:dev_comunity_app/app/constants/colors.dart';
import 'package:dev_comunity_app/app/constants/dimensions.dart';
import 'package:dev_comunity_app/core/viewmodels/login_view_model.dart';
import 'package:dev_comunity_app/meta/views/login_view/login_view_widgets.dart';
import 'package:dev_comunity_app/meta/widgets/app_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: bgColor,
        appBar: appBar(
            titleText: '',
            leadingWidget: null,
            actions: [
              IconButton(
                icon: Icon(EvaIcons.close, color: yellowColor,),
                onPressed: (){

                },
              )
            ]
        ),
        body: _body(model),
      ),
    );
  }

  Widget _body(LoginViewModel loginViewModel){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Welcome to Dev Community',
          style: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 26
          ),
        ),
        countNumOfUsers(numOfUsers: loginViewModel.numOfUsers),
        vSizedBox3,
        authButton(
            authProvider: 'FaceBook',
            iconData: FontAwesomeIcons.facebook,
            color: Colors.blue,
            onPressed: (){

            }
        ),
        vSizedBox1,
        authButton(
            authProvider: 'GitHub',
            iconData: FontAwesomeIcons.github,
            color: bgColorFaint,
            onPressed: (){

            }
        ),
        vSizedBox1,
        authButton(
            authProvider: 'Google',
            iconData: FontAwesomeIcons.google,
            color: Colors.red,
            onPressed: (){

            }
        ),
        vSizedBox3,
        Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/auth.png',),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: darkColor
          ),
          width: 400,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){

                },
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  color: whiteColor,
                ),

              ),
              IconButton(
                onPressed: (){

                },
                icon: Icon(
                  FontAwesomeIcons.facebookF,
                  color: whiteColor,
                ),

              ),
              IconButton(
                onPressed: (){

                },
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  color: whiteColor,
                ),

              ),
              IconButton(
                onPressed: (){

                },
                icon: Icon(
                  FontAwesomeIcons.github,
                  color: whiteColor,
                ),

              ),
              IconButton(
                onPressed: (){

                },
                icon: Icon(
                  FontAwesomeIcons.twitch,
                  color: whiteColor,
                ),

              )
            ],
          ),
        )
      ],
    );
  }
}